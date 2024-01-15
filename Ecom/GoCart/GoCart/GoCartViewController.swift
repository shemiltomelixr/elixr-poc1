//
//  GoCartViewController.swift
//  GoCartViewController
//
//  Created by Devasurya on 28/12/23.
//

import UIKit

/// This viewcontroller is used for displaying items choosed by user.
class GoCartViewController: UIViewController {
    
    /// Variable declaration.
    var delegate: AddDataToMainVC?
    var product = [Product] ()
    @IBOutlet weak var displaycart: UITableView!
    
   
    /// View life cycle which include navigation item setup.
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add To Cart"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "cart.badge.plus"),
            style: .plain,
            target: self,
            action: #selector(didTap)
        )
        reloadData()
    }
    
    /// Function  to  navigate.
    @objc private func didTap() {
        if let addCart = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "CartFunctionalityViewController") as? AddCartViewController {
            addCart.delegate = self
            navigationController?.pushViewController(addCart, animated: true)
        }
    }
    
    /// Function to reload Data inside  a  tableview.
    func reloadData() {
        displaycart.reloadData()
    }
}

/// Extension for AddDataToMainVC protocol
///  /// Protocoal to receiceve the data.
/// - Parameter result: "result" is type "Product"(Model)
extension GoCartViewController: AddDataToMainVC {
    func data(result: Product) {
        product.append(result)
        reloadData()
    }
    

}
