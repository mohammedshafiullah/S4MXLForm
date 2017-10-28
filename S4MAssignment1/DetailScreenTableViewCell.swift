//
//  DetailScreenTableViewCell.swift
//  S4MAssignment1
//
//  Created by Developer on 25/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import UIKit

class DetailScreenTableViewCell: UITableViewCell {

    @IBOutlet var detailSessionTypeLabelObj: UILabel!
    
    
@IBOutlet var detailSessionValueLabelObj: UILabel!
    
    override func awakeFromNib() {
       
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
