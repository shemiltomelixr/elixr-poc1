//
//  ProductCell.swift
//  Ecom
//
//  Created by Shemil Tom on 31/12/23.
//

import UIKit

/// Show data in the cell .
class ProductCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
