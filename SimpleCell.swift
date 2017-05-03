//
//  SimpleCell.swift
//  MenuOnWindow
//
//  Created by piyush sinroja on 29/04/17.
//  Copyright © 2017 Piyush. All rights reserved.
//

import UIKit

class SimpleCell: UITableViewCell {

    
    
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
