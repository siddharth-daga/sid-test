//
//  Article+CoreDataClass.swift
//  
//
//  Created by Siddharth Daga on 21/07/20.
//
//

import Foundation
import CoreData

@objc(Article)
public class Article: NSManagedObject, Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(id, forKey: .id)
        } catch {
            print("error")
        }
    }
    
    required convenience public init(from decoder: Decoder) throws {
        // return the context from the decoder userinfo dictionary
        guard let contextUserInfoKey = CodingUserInfoKey.context,
        let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
        let entity = NSEntityDescription.entity(forEntityName: "Article", in: managedObjectContext)
        else {
            fatalError("decode failure")
        }
        // Super init of the NSManagedObject
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            id = try values.decode(String.self, forKey: .id)
            createdAt = try values.decode(String.self, forKey: .createdAt)
            content = try values.decode(String.self, forKey: .content)
            comments = try values.decode(Int64.self, forKey: .comments)
            likes = try values.decode(Int64.self, forKey: .likes)
            let medias = try values.decode([Media].self, forKey: .media)
            media = NSOrderedSet(array: medias)
            let users = try values.decode([User].self, forKey: .user)
            user = NSOrderedSet(array: users)
        } catch {
            print ("error")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case content = "content"
        case comments = "comments"
        case likes = "likes"
        case media = "media"
        case user = "user"
    }
}
