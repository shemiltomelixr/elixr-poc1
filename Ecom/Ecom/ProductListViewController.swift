//
//  ProductListViewController.swift
//  Ecom
//
//  Created by Shemil Tom on 30/12/23.
//

import UIKit

/// Show list of products added.
class ProductListViewController: UIViewController {
  
    @IBOutlet weak var tableView: UITableView!
    var productListData = [Product] ()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Plus button action in the screen
    @IBAction func plusButton(_ sender: Any) {
        navigateToAddProductsScreen()
    }
    
    /// Move to the AddProducts view controller.
    func navigateToAddProductsScreen() {
        guard let navigateToAddProducts = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddProductsid") as? AddProductsViewController else {
            return
        }
        navigateToAddProducts.delegate = self
        self.navigationController?.pushViewController(navigateToAddProducts, animated: true)
    }

    func reloadProductList() {
        tableView.reloadData()
    }
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productListData.count
    }
    
    /// Showing product deatils in each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ProductCell else {
            return UITableViewCell()
        }
        let productData = productListData[indexPath.row]
        cell.productNameView.text = productData.itemName
        cell.productImageView.image = productData.itemImage
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    /// Deleting product .
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        productListData.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

extension ProductListViewController: TransferDataProtocol {
    
    /// Add new product to productListData.
    /// - Parameter product: Product needed to add.
   func addProduct(product: Product) {
       productListData.append(product)
        reloadProductList()
    }
}
