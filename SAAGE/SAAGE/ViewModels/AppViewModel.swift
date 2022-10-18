//
//  AppViewModel.swift
//  SAAGE
//
//  Created by manraj thind on 2022-01-20.
//

import Foundation
import Firebase

class AppViewModel: ObservableObject {
    let auth = Auth.auth()
    
    @Published var user: User?
    @Published var loggedIn: Bool = false
    @Published var verifiedEmail: Bool = false
    @Published var error: Error?
    @Published var showPrivateViews: Bool = false
    @Published var view: NavigationItems = .login
    @Published var formViewModel: FormViewModel = FormViewModel()
    @Published var testFormViewModel: TestFormViewModel = TestFormViewModel()
    
    init() {
        user = auth.currentUser
        self.checkAuth()
        
        auth.addStateDidChangeListener { auth, user in
            self.user = user
            self.checkAuth()
        }
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password, completion: handleSigninAuthResult)
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password, completion: handleSignupAuthResult)
    }
    
    func signOut() {
        try? auth.signOut()
        self.checkAuth()
//        self.formViewModel.cancelPublishers()
        self.testFormViewModel.cancelPublishers()
    }
    
    private func handleSigninAuthResult(authResult: AuthDataResult?, error: Error?) {
        DispatchQueue.main.async {
            self.user = authResult?.user
            self.error = error
            self.checkAuth()
            self.testFormViewModel.loadTestFormData(userId: self.user?.uid)
//            self.formViewModel.loadFormData(userId: self.user?.uid)
        }
    }
    
    private func handleSignupAuthResult(authResult: AuthDataResult?, error: Error?) {
        DispatchQueue.main.async {
            self.user = authResult?.user
            self.error = error
            if let user = authResult?.user {
                user.sendEmailVerification(completion: { error in
                    print("Sent email verification")
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    }
                })
            }
            self.checkAuth()
        }
    }
    
    private func checkAuth() {
        if let user = self.user {
            self.loggedIn = true
            self.verifiedEmail = user.isEmailVerified
        } else {
            self.loggedIn = false
        }
        
        self.showPrivateViews = self.loggedIn && self.verifiedEmail
        
        if !self.loggedIn {
            self.view = .login
        } else if !self.verifiedEmail {
            self.view = .verifyEmail
        } else {
            self.view = .about
        }
    }
}
