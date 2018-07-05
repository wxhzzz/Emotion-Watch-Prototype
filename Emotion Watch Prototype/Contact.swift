//
//  Contact.swift
//  Emotion Watch Prototype
//
//  Created by Paul Wu on 7/3/18.
//  Copyright © 2018 Paul Wu. All rights reserved.
//
import Foundation
import os.log
class Contact: NSObject,NSCoding {
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("contacts")
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(age, forKey: "age")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: "name") as? String else {
            os_log("Unable to decode the name for a Contact object.", log: OSLog.default, type: .debug)
            return nil
        }
        
       let age = aDecoder.decodeInteger(forKey: "age")
        
        self.init(name: name, age: age)
    }
    
    var name: String
    var age: Int
    
    init(name:String, age:Int){
        self.name=name
        self.age=age
    }
}
