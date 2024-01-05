//
//  functionalityView.swift
//  GoCart
//
//  Created by Devasurya on 27/12/23.
//

import UIKit

/// Protocoal- for transferring data to tableview.
protocol AddDataToMainVC{
    func data(result:Product)
}

/// FunctionalityView is the view responsilbe for the user action to select an image using a pickerview.
class CartFunctionalityViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    /// Referencing Outlet.
    @IBOutlet weak var iconText: UITextField!
    @IBOutlet weak var cartImage: UIImageView!
  
    /// Variable declaration.
    var delegate: AddDataToMainVC?
    
    override func viewDidLoad() {
        
    }

    /// Button Action to  Upload image.
    /// - Parameter sender: UIbutton
    @IBAction func uploadProductImage(_ sender: UIButton) {
        uploadProductImage()
    }
    
    /// didFinishPickingMediaWithInfo is  a built in method in UIImagePickerController to set the result into a constant and asigning that to the UIelement.
    /// - Parameters:
  
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            cartImage.image = pickedImage
            print("image is picked")
            self.dismiss(animated: true)
        }
    }
    
    /// Button action to perform save action.
    /// - Parameter sender: UIbutton.
    @IBAction func saveButton(_ sender: UIButton) {
        userValidation()
    }
    
    /// Decalration of imagepicker object and setting its access.
    func uploadProductImage(){
        let imagePicker=UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.delegate=self
        imagePicker.sourceType =  .photoLibrary
        self.present(imagePicker, animated: true)
    }

    /// Function to check the feilds are empty or not.
    func userValidation() {
        guard let cartItem = iconText.text,!cartItem.isEmpty else {
            showAlert(message: "Cart item field is  empty")
            return
        }
        guard let cartIcon = cartImage.image else{
             showAlert(message: "Cart image field is empty")
            return
        }
        delegate?.data(result: Product(productName: cartItem,productImage: cartIcon))
        navigationController?.popViewController(animated: true)
    }

    /// Function for AlertAction.
    /// - Parameter message: Alert message based on the  vacancy of the feilds.
    func showAlert(message:String){
        let okButton = UIAlertAction(title: "Ok", style: .default)
        let alertOnEmpty=UIAlertController(title: "Empty Feilds", message: "Fill in missing feilds", preferredStyle: .alert)
        alertOnEmpty.addAction(okButton)
        self.present(alertOnEmpty, animated: true)
    }
}



