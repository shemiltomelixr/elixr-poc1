//
//  Loginpage.swift
//  GoCart
//
//  Created by Devasurya on 27/12/23
import UIKit

/// The app starts with a  login screen where user vaalidation is done.
class LoginViewController: UIViewController {
    
    /// Refrencing Outlet of the UI elements.
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var userTextfield: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Button Action to validate user Inputs and navigate once validation is done.
    /// - Parameter sender: UIButton
    @IBAction func signInTapped(_ sender: UIButton)   {
        userValidation()
    }
    
    /// Functions used for userValidation ,alert action and Navigation.
    /// - Returns: Alert function and message .
    func userValidation() {
        guard let userNameInput = userTextfield.text,!userNameInput.isEmpty  else {
            return showAlert(message: "Username field is Empty")
        }
        guard let passwordInput = passwordTextfield.text,!passwordInput.isEmpty else {
            return showAlert(message: "Password field is Empty")
            
        }
        navigateToMain()
    }
    
    ///  Function to perform AlertAction on checking the user input feilds.
    /// - Parameter message: Message based on  the vacancy of textfeilds.
    func showAlert(message: String){
        let ok = UIAlertAction(title: "OK", style: .default)
        let alertDetail = UIAlertController(title: "Missing Fields",message: message, preferredStyle: .alert)
        alertDetail.addAction(ok)
        present(alertDetail, animated: true)
    }
    
    /// Function to navigate
    func navigateToMain() {
        guard let navigationcell=UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GoCartViewController") as? GoCartViewController else {
return
            
        }
        navigationController?.pushViewController(navigationcell, animated: true)
    }
}
