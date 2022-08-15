//
//  DeleteConfirmationView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-05.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import FirebaseStorageSwift

struct DeleteConfirmationView: View {
    @Binding var view: DeleteViews
    @State var deleteType: String
    @State var showError: Bool = false
    @EnvironmentObject var appViewModel: AppViewModel
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Are you sure?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("AppColor"))
            
            Text("Warning:\nYour \(deleteType) will be permanently deleted. This cannot be undone")
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke())
                .padding(.vertical, 40)
            
            HStack {
                Spacer()
                Button("Delete \(deleteType)", action: delete)
                    .buttonStyle(CustomButton(color: Color.red))
                Spacer()
            }
        }
        .alert("Could not Delete Account", isPresented: $showError) {
            Button("OK") {
                appViewModel.signOut()
            }
        } message: {
            Text("There was an issue deleting your account. Please log back in and try again")
        }
    }
}

extension DeleteConfirmationView {
    func delete() {
        if deleteType == "information" {
            print("Deleting information")
            deleteInformation()
            view = .planDeleted
        } else if deleteType == "account" {
            print("Deleting account")
            deleteInformation()
            deleteAccount()
        }
    }
    
    func deleteInformation() {
        if let userId = appViewModel.user?.uid {
            db.collection("forms").document(userId).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                    deleteFiles()
                    appViewModel.formViewModel.formModel = FormModel()
                }
            }
        }
    }
    
    func deleteAccount() {
        appViewModel.user?.delete { error in
            if let error = error {
                print("Error occured deleting account: \(error)")
                showError = true
            } else {
                print("Account Deleted!")
                deleteFiles()
                appViewModel.signOut()
            }
        }
    }
    
    func deleteFiles() {
        let storageReference = storage.reference().child("pdfs/" + (appViewModel.user?.uid)!)
        storageReference.listAll { (result, error) in
            if let error = error {
                print(error)
                showError = true
                return
            }
            for item in result.items {
                let desertRef = storageReference.child(item.name)
                desertRef.delete { error in
                    if let error = error {
                        print(error)
                        showError = true
                        return
                    } else {
                        print("Deletion successful")
                    }
                }

            }
        }
    }
}

struct DeleteConfirmationView_Previews: PreviewProvider {
    @State static var view: DeleteViews = .deleteConfirmation
    static let deleteType: String = "account"
    
    static var previews: some View {
        DeleteConfirmationView(view: $view, deleteType: deleteType)
    }
}
