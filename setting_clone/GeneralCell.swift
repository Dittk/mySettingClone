//
//  GeneralCellTableViewCell.swift
//  setting_clone
//
//  Created by 윤형석 on 2022/08/10.
//

import UIKit

class GeneralCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightImage: UIImageView!{
        didSet{
            rightImage.image = UIImage(systemName: "chevron.right")
            rightImage.tintColor = .black
        }
}
    override func awakeFromNib() {
        super.awakeFromNib()
       
            
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
