//
//  HotSpotViewController.swift
//  setting_clone
//
//  Created by 윤형석 on 2022/08/11.
//

import UIKit

class HotSpotViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotSpotTopModel[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return hotSpotTopModel.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if tableView == topTableView{
            
            if indexPath.section == 0 && indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as!
                GeneralCell
                
                cell.leftLabel.text = hotSpotTopModel[indexPath.section][indexPath.row].menuTitle
                cell.rightLabel.text = hotSpotTopModel[indexPath.section][indexPath.row].rightTitle
                cell.rightImage.image = UIImage(systemName: hotSpotTopModel[indexPath.section][indexPath.row].rightImageName!)
                
                cell.backgroundColor = .systemGray2
                return cell
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "HotSpotCell", for: indexPath) as! HotSpotCell
                
            cell.leftLabel.text = hotSpotTopModel[indexPath.section][indexPath.row].menuTitle
            cell.rightSwitch.isOn = false
            return cell
        }
            
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HotSpotCell", for: indexPath) as! HotSpotCell
            
            cell.leftLabel.text = hotSpotBottomModel[indexPath.section][indexPath.row].menuTitle
            cell.rightSwitch.isOn = false

            return cell
        }
        
        
        
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    var hotSpotTopModel = [[SettingModel]]()
    var hotSpotBottomModel = [[SettingModel]]()
    
    func makeData(){
    
        hotSpotTopModel.append(
            [SettingModel(menuTitle: "다른 사람의 연결 허용", menuTitleColor: .white),
             SettingModel(menuTitle: "Wi-Fi 암호", menuTitleColor: .white, rightImageName: "chevron.right", rightTitle: "11111111")
            ]
        )
        
        hotSpotBottomModel.append(
            [SettingModel(menuTitle: "호환성 최대화", menuTitleColor: .white)]
        )
        
    }
    
    
    
    @IBOutlet weak var topTableView: UITableView!
    @IBOutlet weak var bottomTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topTableView.delegate = self
        topTableView.dataSource = self
        
        bottomTableView.delegate = self
        bottomTableView.dataSource = self
        
        makeData()
        
        self.title = "개인용 핫스팟"
        
        topTableView.register(UINib(nibName: "HotSpotCell", bundle: nil), forCellReuseIdentifier: "HotSpotCell")
        topTableView.register(UINib(nibName: "GeneralCell", bundle: nil), forCellReuseIdentifier: "GeneralCell")
        
        
        bottomTableView.register(UINib(nibName: "HotSpotCell", bundle: nil), forCellReuseIdentifier: "HotSpotCell")
        
        topTableView.layer.cornerRadius = topTableView.bounds.height / 6
        
        bottomTableView.layer.cornerRadius = bottomTableView.bounds.height / 3
        
        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
