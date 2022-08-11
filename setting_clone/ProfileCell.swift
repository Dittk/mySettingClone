//
//  ProfileCell.swift
//  setting_clone
//
//  Created by 윤형석 on 2022/08/08.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var bottomDescription: UILabel!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let profileHeight: CGFloat = 60
        profileImageView.layer.cornerRadius = profileHeight / 2
        
        topTitle.textColor = .blue
        topTitle.font = .systemFont(ofSize: 20)
        
        bottomDescription.textColor = .darkGray
        bottomDescription.font = .systemFont(ofSize: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
