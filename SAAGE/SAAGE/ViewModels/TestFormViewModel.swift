//
//  TestFormViewModel.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-05.
//

import Foundation
import Combine
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import FirebaseStorageSwift

class TestFormViewModel: ObservableObject {
    @Published var testFormModel: TestFormModel
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private var docListener: ListenerRegistration?
    
    var pdfData: Data?
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    init() {
        testFormModel = TestFormModel()
    }
    
    func loadTestFormData(userId: String?) {
        testFormModel = TestFormModel()
        if let userId = userId {
            isLoading = true
            self.docListener = db.collection("forms").document(userId).addSnapshotListener({ documentSnapshot, error in
                if let document = documentSnapshot {
                    if let form = try? document.data(as: TestFormModel.self) {
                        self.testFormModel = form
                        print("Retrieved form data for user: \(userId)")
                    }
                    else {
                        self.updateTestForm(userId: userId, self.testFormModel)
                    }
                    
                    self.$testFormModel
                        .dropFirst()
                        .debounce(for: 0.8, scheduler: RunLoop.main)
                        .sink { testFormModel in
                            self.updateTestForm(userId: userId, testFormModel)
                        }
                        .store(in: &self.cancellables)
                    
                    self.isLoading = false
                }
            })
        }
    }
    
    func cancelPublishers() {
        print("Removing publishers for form model")
        cancellables.removeAll()
        docListener?.remove()
    }
    
    func updateTestForm(userId: String?, _ testFormModel: TestFormModel) {
        if let userId = userId {
            do {
                try db.collection("forms").document(userId).setData(from: testFormModel)
                print("Updated form in db for user: \(userId)")
            } catch {
                fatalError("Unable to update form: \(error.localizedDescription)")
            }
        }
    }
}
