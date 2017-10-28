//
//  AddTableViewTableViewCell.swift
//  S4MAssignment1
//
//  Created by Developer on 26/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import UIKit

class AddTableViewTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    @IBOutlet var checkMarkButtonInvitees: UIButton!

    @IBOutlet var touchView: UIView!
    @IBOutlet var inviteeName: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
