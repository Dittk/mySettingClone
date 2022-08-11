//
//  settingModel.swift
//  setting_clone
//
//  Created by 윤형석 on 2022/08/08.
//

import Foundation
import UIKit

struct SettingModel{
    
    var leftImageName: String = ""
    var leftImageColor: UIColor = .white
    var leftImageBackgroundColor: UIColor = .black
    var menuTitle: String = ""
    var menuTitleColor: UIColor = .white
    var subTitle: String?
    var rightImageName: String?
    var onOff: UISwitch?
}
