//
//  MyCustomViewCell.swift
//  myNavDrawer
//
//  Created by Ahmed Hamdy on 5/20/16.
//  Copyright © 2016 Deu. All rights reserved.
//

import UIKit

class MyCustomViewCell: UITableViewCell {


    @IBOutlet weak var menuItemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
