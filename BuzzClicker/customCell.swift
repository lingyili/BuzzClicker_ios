//
//  customCell.swift
//  BuzzClicker
//
//  Created by Lingyi Li on 3/21/16.
//  Copyright © 2016 Lingyi Li. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {

   
    @IBOutlet var className: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
