//
//  AddContactViewController.swift
//  Emotion Watch Prototype
//
//  Created by Paul Wu on 7/5/18.
//  Copyright © 2018 Paul Wu. All rights reserved.
//

import Foundation
import UIKit
class AddContactViewController:UIViewController{
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    var listViewController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func add(_ sender: UIButton) {
        listViewController.list.append(Contact(name: name.text!, age: Int(age.text!)!, image: UIImage(named: "funny-dog")!))
        NSKeyedArchiver.archiveRootObject(listViewController.list, toFile: Contact.ArchiveURL.path)
        listViewController.loadContacts()
        dismiss(animated: false, completion: nil)
    }
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
}
