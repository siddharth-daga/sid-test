//
//  User+CoreDataClass.swift
//  
//
//  Created by Siddharth Daga on 21/07/20.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(id ?? "" , forKey: .id)
        } catch {
            print("error")
        }
    }
    
    required convenience public init(from decoder: Decoder) throws {
        // return the context from the decoder userinfo dictionary
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "User", in: managedObjectContext)
            else {
                fatalError("decode failure")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            id = try values.decode(String.self, forKey: .id)
            blogId = try values.decode(String.self, forKey: .blogId)
            createdAt = try values.decode(String.self, forKey: .createdAt)
            name = try values.decode(String.self, forKey: .name)
            avatar = try values.decode(String.self, forKey: .avatar)
            lastname = try values.decode(String.self, forKey: .lastname)
            city = try values.decode(String.self, forKey: .city)
            designation = try values.decode(String.self, forKey: .designation)
            about = try values.decode(String.self, forKey: .about)
        } catch {
            print ("error")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case blogId = "blogId"
        case createdAt = "createdAt"
        case name = "name"
        case avatar = "avatar"
        case lastname = "lastname"
        case city = "city"
        case designation = "designation"
        case about = "about"
    }
}
