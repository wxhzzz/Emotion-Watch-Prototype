//
//  ViewController.swift
//  Emotion Watch Prototype
//
//  Created by Paul Wu on 7/2/18.
//  Copyright © 2018 Paul Wu. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController,UITableViewDataSource {
    
    var list=[Contact]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath) as? ContactCell  else {
            fatalError("The dequeued cell is not an instance of ContactCell.")
        }
        let contact=list[indexPath.row]
        cell.textLabel?.text=contact.name
        cell.imageView?.image = contact.image
        return cell
    }
    
    @IBOutlet weak var contactList: UITableView!
    
    override func viewDidLoad() {
        if(!UserDefaults.standard.bool(forKey: "firstLaunch")){
            NSKeyedArchiver.archiveRootObject(list, toFile: Contact.ArchiveURL.path)
            UserDefaults.standard.set(true, forKey: "firstLaunch")
            UserDefaults.standard.synchronize()
        }
        super.viewDidLoad()
        list = (NSKeyedUnarchiver.unarchiveObject(withFile: Contact.ArchiveURL.path) as? [Contact])!
        contactList.dataSource=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addContact(_ sender: UIButton) {
        let add = storyboard?.instantiateViewController(withIdentifier: "add") as! AddContactViewController
        add.listViewController=self
        present(add, animated: false, completion: nil)
    }
    
    private func saveContacts() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(list, toFile: Contact.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Contacts successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save contacts...", log: OSLog.default, type: .error)
        }
    }
    
    func loadContacts(){
        list = (NSKeyedUnarchiver.unarchiveObject(withFile: Contact.ArchiveURL.path) as? [Contact])!
        contactList.reloadData()
    }

}

