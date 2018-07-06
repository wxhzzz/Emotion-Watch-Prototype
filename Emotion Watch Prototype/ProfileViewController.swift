//
//  ProfileViewController.swift
//  Emotion Watch Prototype
//
//  Created by Paul Wu on 7/5/18.
//  Copyright © 2018 Paul Wu. All rights reserved.
//

import Foundation
import UIKit
class ProfileViewController: UIViewController{
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    var username=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let list = (NSKeyedUnarchiver.unarchiveObject(withFile: Contact.ArchiveURL.path) as? [String:Contact])!
        name.text=list[username]?.name
        age.text=String(list[username]!.age)
    }
    
    @IBAction func deleteContact(_ sender: UIButton) {
        
    }
}
