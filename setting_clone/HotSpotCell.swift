//
//  HotSpotCell.swift
//  mySettingClone
//
//  Created by 윤형석 on 2022/08/12.
//

import UIKit

class HotSpotCell: UITableViewCell {

    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var leftLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
