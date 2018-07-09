//
//  Contact.swift

import Foundation
import os.log

class Contact: NSObject,NSCoding {
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("contacts")
    
    //Saves contact as an NSCoder
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(age, forKey: "age")
        aCoder.encode(image, forKey: "image")
    }
    
    //loads object from the NSCoder
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: "name") as? String else {
            os_log("Unable to decode the name for a Contact object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let age = aDecoder.decodeInteger(forKey: "age")
        let image = aDecoder.decodeObject(forKey: "image") as! UIImage
        
        self.init(name: name, age: age, image: image)
    }
    
    var image: UIImage
    var name: String
    var age: Int
    
    init(name:String, age:Int, image: UIImage){
        self.name=name
        self.age=age
        self.image=image
    }
}
