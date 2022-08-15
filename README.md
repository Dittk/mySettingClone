# TableView를 이용한 아이폰 '설정'앱 클론 코딩

<img src = "https://user-images.githubusercontent.com/87113698/184660054-813ad699-5339-4fed-a1a0-b8c6463026d1.gif" width = "300" height = "600"> <img src = "https://user-images.githubusercontent.com/87113698/184659731-6202afaa-6f29-40af-9ef4-c819797f6bed.gif" width = "300" height = "600">

  > **SystemBackgroundColor 사용 -> 라이트모드, 다크모드 대응**
  
  > **각 Cell을 커스텀하여 코드로 TableView에 적용**

  > **AutoLayout Constraint를 적용하여, 다양한 기기에서 대응**

  > **MVP 패턴 적용**

  
  ## SettingModel.swift (Model)

  ```swift
  struct SettingModel{
    
    var leftImageName: String?
    var leftImageColor: UIColor?
    var leftImageBackgroundColor: UIColor?
    
    var menuTitle: String?
    var menuTitleColor: UIColor?
    var subTitle: String?
    
    var rightImageName: String?
    var rightTitle: String?
    
    var onOff: UISwitch?
    
}
  ```
  
  ## ViewController.swift 
  ```swift
      var settingModel = [[SettingModel]]()
    
    func makeData() {
        settingModel.append(
        [SettingModel(leftImageName: "person.circle", menuTitle: "Sign in to your Phone", subTitle: "Set up iCloud, the App Store", rightImageName: nil)]
        )
        
        settingModel.append(
            [SettingModel(leftImageName: "personalhotspot", leftImageColor: .white, leftImageBackgroundColor: .green, menuTitle: "개인용 핫스팟", menuTitleColor: .black, subTitle: nil, rightImageName: "chevron.right"),
             SettingModel(leftImageName: "gear", leftImageColor: .white, leftImageBackgroundColor: .darkGray, menuTitle: "일반", menuTitleColor: .black, subTitle: nil, rightImageName: "chevron.right"),
             SettingModel(leftImageName: "powersleep", leftImageColor: .white, leftImageBackgroundColor: .blue, menuTitle: "집중 모드", menuTitleColor: .black, subTitle: nil, rightImageName: "chevron.right"),
             SettingModel(leftImageName: "sun.max.circle.fill", leftImageColor: .white, leftImageBackgroundColor: .black, menuTitle: "다크 모드", menuTitleColor: .black, subTitle: nil, rightImageName: "chevron.right"),
             ]
        )
            
        settingModel.append(
            [SettingModel(leftImageName: "battery.100", leftImageColor: .white, leftImageBackgroundColor: .green, menuTitle: "배터리", menuTitleColor: .black, subTitle: nil, rightImageName: "chevron.right")]
            )
        
    }
  ```
   > 각 Cell에 대한 Section,Row 바인딩 위해 2차원 배열로 선언

  ```swift
  extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            
            let cell = settingTableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            
            cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName!)
            cell.profileImageView.tintColor = .red
            
            tempCell.append(cell)
            return cell
        }
        
        ...(생략)
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
    
            let idViewCT = idViewController(nibName: "idViewController", bundle: nil)
            self.present(idViewCT, animated: true)
        }
        
        ...(생략)
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        return 50
    }
  ```
  > extension으로 TableView에 대한 Delegate, DataSource 메서드 정의

  ## Cell
  
  > 로그인 Cell, 메뉴 Cell, Toggle이 삽입된 메뉴 Cell

  > 하나의 Cell을 재사용 -> Model의 데이터에 바인딩

   #### ProfileCell.xib (로그인 Cell)
   <img width="407" alt="image" src="https://user-images.githubusercontent.com/87113698/184666082-c97494aa-8248-4a7a-b2ae-05cc6250cca0.png">
  
   #### MenuCell.xib (메뉴 Cell)
   <img width="497" alt="image" src="https://user-images.githubusercontent.com/87113698/184664203-642de581-264e-448c-8537-4efbbf6c3537.png">
   
   #### HotspotCell.xib (Toggle이 삽입된 메뉴 Cell)
   <img width="348" alt="image" src="https://user-images.githubusercontent.com/87113698/184666437-9b1a801a-0867-48b8-a936-fcfee7c2a39b.png">

  ## 세부 메뉴
  
  > 세부 메뉴는 .storyboard로 구성

   #### HotSpotViewController.storyboard (핫스팟 세부 메뉴)
   <img width="259" alt="image" src="https://user-images.githubusercontent.com/87113698/184667348-b3baf87c-ee65-4fad-8288-ced296a2200a.png"> <img width="300" height="600" alt="image" src="https://user-images.githubusercontent.com/87113698/184668516-72415504-b75f-41d6-a241-5597f6802ec0.png">

   
   > 2개의 TableView 구성, 각 TableView에 Cell 바인딩

  ## 느낀점
  
  swfitUi를 접하기 전에, 먼저 uikit를 접해야 된다고 생각하여 간단한 설정 앱 클론코딩을 해보았다. uikit에 정말 방대한 많은 기능이 있지만, 가장 기본적이며 자주쓰이는 TableView에 대하여
  먼저 공부를 하였다. 이 공부한 것을 토대로 무엇을 만들면 좋을지 고민을 하였고, 설정 앱이 아주 적합한 연습물로 보였다. 
  
  과정은 생각보다 쉽지 않았으며 코드를 그냥 복붙을 하는 것이 아닌, 손으로 직접 타이핑을 하며 이해 할려고 노력했다. 이렇게 하면 확실히 더 오래 걸리는 느낌이 있지만, 
  기억에 많이 남고 기본기가 점점 쌓여감으로써 응용을 할 수 있을 것 같았다. 확실히 최고의 공부법은, 이론에 대한 공부 후 자신의 힘으로 직접 결과물을 만들어 보는 것이라고 다시 한번 느꼈다. 
  
  이번 클론코딩을 하면서 View에 대한 생명주기 및 어떨때 .xib 파일과 .storyboard 파일이 사용되는지 등 
  얕은 지식들을 직접 경험해보며 많이 알게되었다. 
  어려웠던점은, 구글링 시 ios에 대한 자료들이 대부분 영어로 되어있어서 습득하는데 시간이 조금 걸렸다는 점이다. 
  
  **영어 공부 또한 열심히 해야겠다는 생각이 든다 ,,,**
    

  


   
    
        
    
    
    
