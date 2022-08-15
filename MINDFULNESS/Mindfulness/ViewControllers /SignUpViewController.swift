//
//  SignUpViewController.swift
//  Mindfulness
//
//  Created by Rahul Jasani on 2022-02-23.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // check the fields and validate the data is correct if everything is ok.
    // if everything is ok then the method is fine, else we return the error
    func validateField() -> String? {
        // check if all fiellds are filled
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all the fields."
        }
        
        //check if the password is safe (strip and make sure the name case matches)
        
        return nil // this is the pass case
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        // validate the fields
    
        
        let error = validateField()
        if error != nil {
           showError(error!)
        }
        else {
            
            let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // create the user
            // transition to the home screen
            Auth.auth().createUser(withEmail: email, password: password) {( result, err) in
                if err != nil, let err = err as NSError? {
                    
                    if let errorCode = AuthErrorCode(rawValue: err.code) {
                        switch errorCode {
                        case .weakPassword:
                            self.showError("The password entered is too weak")
                        case .invalidEmail:
                            self.showError("The email entered was invalid")
                        case .emailAlreadyInUse:
                            self.showError("This email is already in use")
                        default:
                            // there was an error of some sort
                            self.showError("Error creating user")
                        }
                    }
                }
                else {
                    let db = Firestore.firestore()
                    
                    db.collection("users").document(result!.user.uid).setData(["name":name, "email":email, "uid": result!.user.uid, "favourites": []]) { (error) in
                        
                        if error != nil {
                                self.showError("Error saving user data")
                        }
                    }
                    // we need to transition into the home screen
                    self.transitionToHome()
                    
                }  // end of nested else
            } // end of Auth for creating user
        }// end of else
       
    }
     
    // displays the error message to the user
    func showError(_ message:String)  {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? ViewController
        
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
    }
    
}
