//
//  LoginView.swift
//  SAAGE
//
//  Created by X on 1/20/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @Environment(\.colorScheme) var colorScheme: ColorScheme
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
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("Email").foregroundColor(Color.black)
                    }
                    TextField("Email", text: $email)
                        .textContentType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                }
                .padding(5)
                .border(Color.black)
                .background(Color.white)
                
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Password").foregroundColor(Color.black)
                    }
                    SecureField("Password", text: $password)
                        .textContentType(.password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                }
                .padding(5)
                .border(Color.black)
                .background(Color.white)
                                
                if let error = appViewModel.error {
                    Text(error.localizedDescription)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Button(action: {
                    appViewModel.signIn(email: email, password: password)
                }, label: {
                    Text("Log in")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.vertical)
                        .background(Color("AppColor"))
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                        .font(.title3.bold())
                        .cornerRadius(10)
                })
                
                Button("Sign up") {
                    appViewModel.view = .signUp
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color(red: 0.86, green: 0.914, blue: 0.776)))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
            
            Text("This project is currently in beta testing. It was developed by The University of Toronto, Department of Physical Therapy, with funding from the Praxis Spinal Cord Institute")
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            
            Button(action: {
                print("Clicked about button")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().colorScheme(.dark)
    }
}

