//
//  User+CoreDataProperties.swift
//  
//
//  Created by Siddharth Daga on 21/07/20.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: String?
    @NSManaged public var blogId: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var name: String?
    @NSManaged public var avatar: String?
    @NSManaged public var lastname: String?
    @NSManaged public var city: String?
    @NSManaged public var designation: String?
    @NSManaged public var about: String?

}
