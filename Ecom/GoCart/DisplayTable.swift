//
//  DisplayTable.swift
//  GoCart
//
//  Created by Devasurya on 01/01/24.
//

import Foundation
import UIKit

extension GoCartViewController: UITableViewDelegate, UITableViewDataSource {
    
    /// Tableview method to perform delete products while swiping.
    /// - Parameters:
    ///   - tableView:     /// Tableview method to perform delete products while swiping.
    ///   - editingStyle: If editing style is set to .delete  then each iitem can be removed by swiping.
    ///   - indexPath: Whenever a swipe action is done , indexpath gets the value of the cell in which specfic action is performed, as per this value the data from the inventoryArray is removed
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle  == .delete{
            inventoryArray.remove(at: indexPath.row)
            displaycart.reloadData()
        }
    }
    
    /// Numberof RowsInsection method is used to inform tableview about number of cells in the table.
    /// - Parameters:
    ///   - tableView:  /// Numberof RowsInsection method is used to inform tableview about number of cells in the table.
    /// - Returns: Integer.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        inventoryArray.count
    }
    
    
    /// Cell for row at - method used to populate the tableview with data.
    /// - Parameters:
    ///   - indexPath: According to this value the data is added to the tableview specific to each row.
    /// - Returns: UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cartContents = tableView.dequeueReusableCell(withIdentifier: "CartDispalyCell")as? CartDispalyCell
        else{
            return CartDispalyCell()
            
        }
        let finalProduct=inventoryArray[indexPath.row]
        cartContents.iconImage.image = finalProduct.productImage
        cartContents.iconTxt.text = finalProduct.productName
        
        return cartContents
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
