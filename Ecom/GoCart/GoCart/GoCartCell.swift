//
//  CartDispalyCell.swift
//  GoCart
//
//  Created by Devasurya on 27/12/23.

import UIKit

/// This is the file of type UITableviewCell  created inorder to initalize tableview and UI elements used in it.
class GoCartCell: UITableViewCell {
    // UIelements declarations.
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var displayView: UIView!
    @IBOutlet weak var iconTxt: UILabel!
    
    /// Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file.
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
