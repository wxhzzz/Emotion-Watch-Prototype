//
//  ContactTable.swift
//  Emotion Watch Prototype
//
//  Created by Margaret Reed on 7/9/18.
//  Copyright © 2018 Paul Wu. All rights reserved.
//

import Foundation
import WatchKit
//import os.log



class ContactTable: WKInterfaceController {
    @IBOutlet var contactTable: WKInterfaceTable!
    
    let names = ["Maggie", "Paul", "Abiy"]
    let images = ["funny-dog", "beagle", "pug"]
    
    class RowController: NSObject {
        @IBOutlet var label: WKInterfaceLabel!
        @IBOutlet var image: WKInterfaceImage!
        
        //func setNumberOfRows(_:withRowType:)
        
    }
    
    func loadTable() {
        contactTable.setNumberOfRows(names.count, withRowType: "RowController")
        for index in 0...2 {
            let row = contactTable.rowController(at: index) as! RowController
            row.label.setText(names[index])
            row.image.setImage(UIImage(named: images[index]))
        }
    }
    
    

    
    
  
}


