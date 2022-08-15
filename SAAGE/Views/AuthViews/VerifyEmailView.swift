//
//  VerifyEmailView.swift
//  SAAGE
//
//  Created by X on 1/24/22.
//

import SwiftUI

struct VerifyEmailView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Please confirm your e-mail address")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("AppColor"))
            
            Text("Confirm your identity using the link in the email message we sent to the address you provided (you may need to check your spam folder).")
            
            HStack {
                Spacer()
                Button("Log in once confirmed") {
                    appViewModel.view = .login
                }
                Spacer()
            }
        }
    }
}

struct VerifyEmailView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyEmailView()
    }
}
