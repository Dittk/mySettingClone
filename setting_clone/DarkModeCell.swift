//
//  DarkModeCell.swift
//  setting_clone
//
//  Created by 윤형석 on 2022/08/10.
//

import UIKit

class DarkModeCell: UITableViewCell {

    @IBOutlet weak var swtich: UISwitch!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
