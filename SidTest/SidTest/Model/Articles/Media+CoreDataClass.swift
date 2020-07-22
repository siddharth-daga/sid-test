//
//  Media+CoreDataClass.swift
//  
//
//  Created by Siddharth Daga on 21/07/20.
//
//

import Foundation
import CoreData

@objc(Media)
public class Media: NSManagedObject, Codable {
    
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
            let entity = NSEntityDescription.entity(forEntityName: "Media", in: managedObjectContext)
            else {
                fatalError("decode failure")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            id = try values.decode(String.self, forKey: .id)
            blogId = try values.decode(String.self, forKey: .blogId)
            createdAt = try values.decode(String.self, forKey: .createdAt)
            image = try values.decode(String.self, forKey: .image)
            title = try values.decode(String.self, forKey: .title)
            url = try values.decode(String.self, forKey: .url)
        } catch {
            print ("error")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case blogId = "blogId"
        case createdAt = "createdAt"
        case image = "image"
        case title = "title"
        case url = "url"
    }
}
