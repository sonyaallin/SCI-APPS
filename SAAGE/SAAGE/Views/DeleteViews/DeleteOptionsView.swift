//
//  DeleteOptionsView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-05.
//

import SwiftUI

struct DeleteOptionsView: View {
    @Binding var view: DeleteViews
    @Binding var deleteType: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            VStack(alignment: .leading, spacing: 15) {
                Text("Are you sure?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AppColor"))
                Text("If you choose to delete your information, everything you have entered on the care plan form will be erased permanently. This cannot be undone.").fixedSize(horizontal: false, vertical: true)
                
            }
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Delete Information")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Permanently delete your care plan information:")
                
                HStack {
                    Spacer()
                    Button("Delete Information", action: deleteInfo)
                        .buttonStyle(CustomButton(color: Color.red))
                    Spacer()
                }
            }
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Delete Account")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Permanently delete your care plan information and your user account (you will need to sign up again to create a new care plane):")
                
                HStack {
                    Spacer()
                    Button("Delete My Account", action: deleteAccount)
                        .buttonStyle(CustomButton(color: Color.red))
                    Spacer()
                }
            }
        }
    }
}

extension DeleteOptionsView {
    func deleteInfo() {
        print("Clicked delete info button")
        deleteType = "information"
        view = .deleteConfirmation
    }
    
    func deleteAccount() {
        print("Clicked delete account button")
        deleteType = "account"
        view = .deleteConfirmation
    }
}

struct DeleteOptionsView_Previews: PreviewProvider {
    @State static var view: DeleteViews = .deleteOptions
    @State static var deleteType: String = ""
    
    static var previews: some View {
        DeleteOptionsView(view: $view, deleteType: $deleteType)
    }
}
