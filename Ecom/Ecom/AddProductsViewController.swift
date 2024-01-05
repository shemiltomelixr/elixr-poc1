//
//  AddProductsViewController.swift
//  Ecom
//
//  Created by Shemil Tom on 31/12/23.
//

import UIKit

/// Protocol to pass data to ProductList view controller
protocol TransferDataProtocol: AnyObject {
    /// Add products to pass data
    /// - Parameter product: The product needed to add
    func addProduct(product: Product)
}

/// To add products with required data.
class AddProductsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    /// To pass data
    weak var delegate: TransferDataProtocol?
    
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productImage: UIImageView!
    
    /// Select image from phone gallary.
    @IBAction func selectImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    /// Save the text and image which is selected and move to the previous view controller
    @IBAction func saveProductDetails(_ sender: Any) {
        guard let productName = productName.text, !productName.isEmpty else {
            showAlert(message: "Product name is required")
            return
        }
        
        guard let productImage = productImage.image else {
            showAlert(message: "Product image is required")
            return
        }
        
        let newProduct = Product(itemName: productName, itemImage: productImage)
        delegate?.addProduct(product: newProduct)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Getting the image data for product
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            productImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    /// Alert for product details if empty
    /// - Parameter message: message details.
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
