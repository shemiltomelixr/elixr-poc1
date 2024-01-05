//
//  LoginPage.swift
//  Ecom
//
//  Created by Shemil Tom on 30/12/23.
//

import UIKit

/// Login page with necceary fields
class LoginPageViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    /// Sign in button  action
    @IBAction func signIn(_ sender: Any) {
        authenticateSignIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Authenticate userdata and navigate to AddProducts view controller.
    func authenticateSignIn() {
        guard let username = userNameTextField.text, !username.isEmpty else {
            showAlert(message: "Please enter a username.")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Please enter a password.")
            return
        }
        performSegue(withIdentifier: "productListSegue", sender: self)
    }
    
    /// Alert message for authentication.
    /// - Parameter message: show message description
    func showAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
}
