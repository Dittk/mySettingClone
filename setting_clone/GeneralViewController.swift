//
//  GeneralViewController.swift
//  setting_clone
//
//  Created by 윤형석 on 2022/08/09.
//

import UIKit



class GeneralViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct GeneralModel{
        var leftLabel: String = ""
    }
    
    var generalModel = [[GeneralModel]]()
    
    func makeGeneralData() {
       
        
        generalModel.append(
        [GeneralModel(leftLabel: "정보")]
        )
        
        generalModel.append(
        [GeneralModel(leftLabel: "AirDrop"),
         GeneralModel(leftLabel: "AirPlay 및 Handoff"),
         GeneralModel(leftLabel: "화면 속 화면")]
        )
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generalModel[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return generalModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell
        cell.leftLabel.text = generalModel[indexPath.section][indexPath.row].leftLabel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
    

    @IBOutlet weak var generalTableView: UITableView!
    
    override func viewDidLoad() {
        
        generalTableView.delegate = self
        generalTableView.dataSource = self
        makeGeneralData()
        
        self.title = "일반"
        generalTableView.register(UINib(nibName: "GeneralCell", bundle: nil), forCellReuseIdentifier: "GeneralCell")
        super.viewDidLoad()
        
        
    }



}
