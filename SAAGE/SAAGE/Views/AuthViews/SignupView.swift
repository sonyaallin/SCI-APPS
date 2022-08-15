//
//  SignupView.swift
//  SAAGE
//
//  Created by X on 1/24/22.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Living with spinal cord injury?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("AppColor"))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Share information about your care requirements with health care providers")
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            
            VStack(spacing: 10) {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(5)
                    .background(Color.white)
                    .border(Color.black)
                
                SecureField("Password", text: $password)
                    .textContentType(.newPassword)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(5)
                    .background(Color.white)
                    .border(Color.black)
                
                if let error = appViewModel.error {
                    Text(error.localizedDescription)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Button(action: {
                    appViewModel.signUp(email: email, password: password)
                }, label: {
                    Text("Sign up")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.vertical)
                        .background(Color("AppColor"))
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                        .font(.title3.bold())
                        .cornerRadius(10)
                })
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color(red: 0.86, green: 0.914, blue: 0.776)))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
            
            Text("This project is currently in beta testing. It was developed by The University of Toronto, Department of Physical Therapy, with funding from the Praxis Spinal Cord Institute")
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            
            Button(action: {
                appViewModel.view = .about
            }, label: {
                Text("About this project")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color("AppColor"))
                    .font(.title3.bold())
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
            })
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView().environmentObject(AppViewModel())
    }
}
