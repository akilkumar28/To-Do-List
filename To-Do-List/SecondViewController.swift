//
//  SecondViewController.swift
//  To-Do-List
//
//  Created by AKIL KUMAR THOTA on 6/4/17.
//  Copyright © 2017 Akil Kumar Thota. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var userTxtFld: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    @IBAction func addBtnPrssd(_ sender: Any) {
        
        var items:[String] = [String]()
        let itemObjects = UserDefaults.standard.object(forKey: "items")
        if let item1 = itemObjects as? [String] {
            if !(userTxtFld.text?.isEmpty)!{
                items = item1
                items.append(userTxtFld.text!)
                UserDefaults.standard.set(items, forKey: "items")
            }
        }else {
            if !((userTxtFld.text?.isEmpty)!){
                items = [userTxtFld.text!]
                UserDefaults.standard.set(items, forKey: "items")
            }
        }
        self.userTxtFld.text = nil
        self.userTxtFld.endEditing(true)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

