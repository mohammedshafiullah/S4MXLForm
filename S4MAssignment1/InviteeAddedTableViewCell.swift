//
//  InviteeAddedTableViewCell.swift
//  S4MAssignment1
//
//  Created by mohammed shafiullah on 29/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import UIKit

class InviteeAddedTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var initialName: UILabel!

    @IBOutlet var inviteeName: UILabel!

    @IBOutlet var inviteePosition: UILabel!
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
