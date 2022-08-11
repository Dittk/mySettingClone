//
//  idViewController.swift
//  setting_clone
//
//  Created by 윤형석 on 2022/08/11.
//

import UIKit

class idViewController: UIViewController{

    

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nextButton: UIButton!{
        didSet{
            nextButton.isEnabled = false
        }
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
        
       

    }

    @objc func textFieldDidChange(sender: UITextField) {

        if !(sender.text?.isEmpty == true) {
            nextButton.isEnabled = true
        }
        else{
            nextButton.isEnabled = false

        }
    }

   


}
