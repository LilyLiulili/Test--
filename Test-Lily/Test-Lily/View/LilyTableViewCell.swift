//
//  LilyTableViewCell.swift
//  Test-Lily
//
//  Created by lily on 2018/5/29.
//  Copyright © 2018年 Lily. All rights reserved.
//

import UIKit

class LilyTableViewCell: UITableViewCell {
typealias buttonClickedBlock = () -> Void
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    var AButtonBlock: buttonClickedBlock?
    var BButtonBlock: buttonClickedBlock?
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    @IBAction func AButtonClicked(_ sender: Any) {
        AButtonBlock?()
    }
    @IBAction func BButtonClicked(_ sender: Any) {
        BButtonBlock?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
