//
//  ConcentrationVC.swift
//  setting_clone
//
//  Created by 윤형석 on 2022/08/10.
//

import Foundation
import UIKit

class ConcentrationVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        concentData[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return concentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConcentrationCell", for: indexPath) as! ConcentrationCell
        
        cell.leftImage.image = UIImage(systemName: concentData[indexPath.section][indexPath.row].leftImageName)
        cell.topTItle.text = concentData[indexPath.section][indexPath.row].menuTitle
        cell.rightImage.image = UIImage(systemName: concentData[indexPath.section][indexPath.row].rightImageName!)
        cell.rightImage.tintColor = .lightGray
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    @IBOutlet weak var concentTableView: UITableView!
    
    var concentData = [[SettingModel]]()
    
    func makeData() {
        concentData.append(
            [SettingModel(leftImageName: "moon.fill", menuTitle: "방해금지 모드", subTitle: nil, rightImageName: "chevron.right"),
             SettingModel(leftImageName: "person", menuTitle: "개인 시간", subTitle: nil, rightImageName: "chevron.right"),
             SettingModel(leftImageName: "bed.double.fill", menuTitle: "수면", subTitle: nil, rightImageName: "chevron.right"),
             SettingModel(leftImageName: "person.text.rectangle.fill", menuTitle: "업무", subTitle: nil, rightImageName: "chevron.right")]
        )
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        concentTableView.delegate = self
        concentTableView.dataSource = self
        concentTableView.register(UINib(nibName: "ConcentrationCell", bundle: nil), forCellReuseIdentifier: "ConcentrationCell")
        makeData()
        self.title = "집중 모드"
        concentTableView.backgroundColor = UIColor(white: 244/255, alpha: 1)
    }
    
    
    
}
