//
//  FirstViewController.swift
//  To-Do-List
//
//  Created by AKIL KUMAR THOTA on 6/4/17.
//  Copyright © 2017 Akil Kumar Thota. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var items:[String] = [String]()

    
    
    @IBOutlet weak var myTableView: UITableView!
    

    
    override func viewDidAppear(_ animated: Bool) {
        self.myTableView.allowsMultipleSelectionDuringEditing = false
        let itemObjects = UserDefaults.standard.object(forKey: "items")
        if let item1 = itemObjects as? [String] {
            items = item1
        }
        self.myTableView.reloadData()
    }
    
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
        cell.textLabel?.text = items[indexPath.row]
        return cell
        }else {
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .fade)
            UserDefaults.standard.set(items, forKey: "items")
        }
    }
    
    
    
    

}

