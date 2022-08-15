//
//  LoginViewController.swift
//  Mindfulness
//
//  Created by Rahul Jasani on 2022-02-23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
        
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginTapped(_ sender: Any) {
        // Validate the text fields, make sure all the fields are filled in before logging in
        
        // Signing in the user
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) {(result, error) in
            
            if error != nil, let error = error as NSError? {
                
                // ensure more switch cases to make sure more accurate description
                if let errorCode = AuthErrorCode(rawValue: error.code) {
                    switch errorCode {
                    case .wrongPassword:
                        self.showError("The password entered is incorrect")
                    case .userNotFound:
                        self.showError("This email does not exist")
                    default:
                        // there was an error of some sort
                        self.showError("Error signing in user")
                    }
                }
            }
            else {
                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? ViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    
    // displays the error message to the user
    func showError(_ message:String)  {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}
