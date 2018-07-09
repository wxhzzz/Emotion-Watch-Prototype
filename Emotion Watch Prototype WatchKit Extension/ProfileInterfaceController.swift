//
//  ProfileInterfaceController.swift
//  Emotion Watch Prototype WatchKit Extension
//
//  Created by Abiy Tekle on 7/9/18.
//  Copyright © 2018 Paul Wu. All rights reserved.
//

import Foundation
import WatchKit
class ProfileInterfaceController:WKInterfaceController{

    @IBOutlet var UserImage: WKInterfaceImage!
    @IBOutlet var name: WKInterfaceLabel!
    
    @IBOutlet var age: WKInterfaceLabel!
   // var list = [String:Contact]()
    var username=""
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        name.setText("Paul")
        UserImage.setImage(UIImage(named: "funny-dog"))
        
//        list = (NSKeyedUnarchiver.unarchiveObject(withFile: Contact.ArchiveURL.path) as? [String:Contact])!
//        name.setText(list[username]?.name)
//        age.setText(String(list[username]!.age))
//        UserImage.setImage(list[username]?.image)
    }
}
