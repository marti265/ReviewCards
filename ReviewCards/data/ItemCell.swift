//
//  TableViewCell.swift
//  HW4
//
//  Created by Jose on 4/4/19.
//  Copyright © 2019 Jose. All rights reserved.
//


import UIKit

class ItemCell: UITableViewCell {
    //class variables
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
    
}
