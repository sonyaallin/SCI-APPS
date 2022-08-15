//
//  FormViewModel.swift
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

class FormViewModel: ObservableObject {
    @Published var formModel: FormModel
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private var docListener: ListenerRegistration?
    
    var pdfData: Data?
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    init() {
        formModel = FormModel()
    }
    
    func loadFormData(userId: String?) {
        formModel = FormModel()
        if let userId = userId {
            isLoading = true
            self.docListener = db.collection("forms").document(userId).addSnapshotListener({ documentSnapshot, error in
                if let document = documentSnapshot {
                    if let form = try? document.data(as: FormModel.self) {
                        self.formModel = form
                        print("Retrieved form data for user: \(userId)")
                    }
                    else {
                        self.updateForm(userId: userId, self.formModel)
                    }
                    
                    self.$formModel
                        .dropFirst()
                        .debounce(for: 0.8, scheduler: RunLoop.main)
                        .sink { formModel in
                            self.updateForm(userId: userId, formModel)
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
    
    func updateForm(userId: String?, _ formModel: FormModel) {
        if let userId = userId {
            do {
                try db.collection("forms").document(userId).setData(from: formModel)
                print("Updated form in db for user: \(userId)")
            } catch {
                fatalError("Unable to update form: \(error.localizedDescription)")
            }
        }
    }
}
