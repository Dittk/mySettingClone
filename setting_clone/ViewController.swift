//
//  ViewController.swift
//  setting_clone
//
//  Created by 윤형석 on 2022/08/08.
//

import UIKit

class ViewController: UIViewController  {
    
    @objc func onClickSwitch(sender: UISwitch){
        if sender.isOn {
            settingTableView.backgroundColor = .black
            self.navigationController?.navigationBar.barStyle = .black
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            for i in 0..<tempCell.count{
                tempCell[i].backgroundColor = .lightGray
            }
       
        }
        else{
            settingTableView.backgroundColor = .white
            navigationController?.navigationBar.barStyle = .default
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
            for i in 0..<tempCell.count{
                tempCell[i].backgroundColor = .white
            }
            settingTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        }
    }
    
    
    
    
    
    @IBOutlet weak var settingTableView: UITableView!

    var tempCell = [UITableViewCell]()

    var settingModel = [[SettingModel]]()
    
    func makeData() {
        settingModel.append(
        [SettingModel(leftImageName: "person.circle", menuTitle: "Sign in to your Phone", subTitle: "Set up iCloud, the App Store", rightImageName: nil)]
        )
        
        settingModel.append(
            [SettingModel(leftImageName: "sun.max.circle.fill", leftImageColor: .white, leftImageBackgroundColor: .black, menuTitle: "다크 모드", menuTitleColor: .black, subTitle: nil, rightImageName: "chevron.right"),
             SettingModel(leftImageName: "gear", leftImageColor: .white, leftImageBackgroundColor: .lightGray, menuTitle: "설정", menuTitleColor: .black, subTitle: nil, rightImageName: "chevron.right"),
             SettingModel(leftImageName: "powersleep", leftImageColor: .white, leftImageBackgroundColor: .blue, menuTitle: "집중 모드", menuTitleColor: .black, subTitle: nil, rightImageName: "chevron.right"),
             SettingModel(leftImageName: "personalhotspot", leftImageColor: .white, leftImageBackgroundColor: .green, menuTitle: "개인용 핫스팟", menuTitleColor: .black, subTitle: nil, rightImageName: "chevron.right"),
             ]
        )
            
        settingModel.append(
            [SettingModel(leftImageName: "battery.100", leftImageColor: .white, leftImageBackgroundColor: .green, menuTitle: "배터리", menuTitleColor: .black, subTitle: nil, rightImageName: "chevron.right")]
            )
        
    }
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        self.title = "Settings"

        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        
        settingTableView.register(UINib(nibName: "menuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        
        settingTableView.register(UINib(nibName: "DarkModeCell", bundle: nil), forCellReuseIdentifier: "DarkModeCell")
        
        settingTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        
        self.view.backgroundColor = UIColor(white: 244/245, alpha: 1)
        makeData()
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            
            let cell = settingTableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            
            cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.profileImageView.tintColor = .red
            
            
            
            tempCell.append(cell)
            return cell
        }
        
        if indexPath.section == 1 && indexPath.row == 0 {
            let cell = settingTableView.dequeueReusableCell(withIdentifier: "DarkModeCell", for: indexPath) as! DarkModeCell
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.leftImage.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.leftImage.tintColor = settingModel[indexPath.section][indexPath.row].leftImageColor
            cell.leftImage.backgroundColor = settingModel[indexPath.section][indexPath.row].leftImageBackgroundColor
            cell.leftImage.layer.cornerRadius = cell.leftImage.bounds.width / 3
            cell.swtich.setOn(false, animated: true)
            cell.swtich.addTarget(self, action: #selector(onClickSwitch(sender:)), for: UIControl.Event.valueChanged)
            
            tempCell.append(cell)
            return cell
        }
        
        
        let cell = settingTableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! menuCell

        cell.leftImage.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
        cell.leftImage.tintColor = settingModel[indexPath.section][indexPath.row].leftImageColor
        cell.leftImage.backgroundColor = settingModel[indexPath.section][indexPath.row].leftImageBackgroundColor
        
        cell.leftImage.layer.cornerRadius = cell.leftImage.bounds.width / 3
        
        cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
        cell.middleTitle.textColor = settingModel[indexPath.section][indexPath.row].menuTitleColor
        
        cell.rightImage.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName!)
        cell.rightImage.tintColor = .lightGray
        
        tempCell.append(cell)
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
    
            let idViewCT = idViewController(nibName: "idViewController", bundle: nil)
            self.present(idViewCT, animated: true)
        }
        
        
        
        else if indexPath.section == 1 && indexPath.row == 1 {
            if let generalViewController = UIStoryboard(name: "GeneralViewController", bundle: nil).instantiateViewController(withIdentifier: "GeneralViewController") as? GeneralViewController{
                self.navigationController?.pushViewController(generalViewController, animated: true)
                self.navigationController?.navigationBar.prefersLargeTitles = false
            }
        }
        
        else if indexPath.section == 1 && indexPath.row == 2 {
            
            if let concentrationVC = UIStoryboard(name: "ConcentrationVC", bundle: nil).instantiateViewController(withIdentifier: "ConcentrationVC") as? ConcentrationVC {
                self.navigationController?.pushViewController(concentrationVC, animated: true)
                self.navigationController?.navigationBar.prefersLargeTitles = false
            }
        
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        return 50
    }
    
   
    
}
