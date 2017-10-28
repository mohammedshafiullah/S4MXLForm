//
//  SessionTableViewCell.swift
//  S4MAssignment1
//
//  Created by mohammed shafiullah on 25/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import UIKit

class SessionTableViewCell: UITableViewCell {

    @IBOutlet weak var topViewHeightC: NSLayoutConstraint!
    
    //////outlet objects//////
    @IBOutlet var initialNmaeLabelObj: UILabel!
    @IBOutlet var accountNameLabelObj: UILabel!
    @IBOutlet var ownerNameLabelObj: UILabel!
    @IBOutlet var startAndEndDateLabelObj: UILabel!
    @IBOutlet var locationLabelObj: UILabel!
    @IBOutlet var subjectLabelObj: UILabel!
    @IBOutlet var ongoingSessionTimeLabelObj: UILabel!
    @IBOutlet var timeDispView: UIView!
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet var superViewOfCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initialNmaeLabelObj.layer.cornerRadius = 25
        initialNmaeLabelObj.layer.borderWidth = 2
        initialNmaeLabelObj.layer.borderColor = UIColor.lightGray.cgColor
        initialNmaeLabelObj.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
