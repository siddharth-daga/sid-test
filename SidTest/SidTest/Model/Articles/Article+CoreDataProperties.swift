//
//  Article+CoreDataProperties.swift
//  
//
//  Created by Siddharth Daga on 21/07/20.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var id: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var content: String?
    @NSManaged public var comments: Int64
    @NSManaged public var likes: Int64
    @NSManaged public var media: NSOrderedSet?
    @NSManaged public var user: NSOrderedSet?

}

// MARK: Generated accessors for media
extension Article {

    @objc(insertObject:inMediaAtIndex:)
    @NSManaged public func insertIntoMedia(_ value: Media, at idx: Int)

    @objc(removeObjectFromMediaAtIndex:)
    @NSManaged public func removeFromMedia(at idx: Int)

    @objc(insertMedia:atIndexes:)
    @NSManaged public func insertIntoMedia(_ values: [Media], at indexes: NSIndexSet)

    @objc(removeMediaAtIndexes:)
    @NSManaged public func removeFromMedia(at indexes: NSIndexSet)

    @objc(replaceObjectInMediaAtIndex:withObject:)
    @NSManaged public func replaceMedia(at idx: Int, with value: Media)

    @objc(replaceMediaAtIndexes:withMedia:)
    @NSManaged public func replaceMedia(at indexes: NSIndexSet, with values: [Media])

    @objc(addMediaObject:)
    @NSManaged public func addToMedia(_ value: Media)

    @objc(removeMediaObject:)
    @NSManaged public func removeFromMedia(_ value: Media)

    @objc(addMedia:)
    @NSManaged public func addToMedia(_ values: NSOrderedSet)

    @objc(removeMedia:)
    @NSManaged public func removeFromMedia(_ values: NSOrderedSet)

}

// MARK: Generated accessors for user
extension Article {

    @objc(insertObject:inUserAtIndex:)
    @NSManaged public func insertIntoUser(_ value: User, at idx: Int)

    @objc(removeObjectFromUserAtIndex:)
    @NSManaged public func removeFromUser(at idx: Int)

    @objc(insertUser:atIndexes:)
    @NSManaged public func insertIntoUser(_ values: [User], at indexes: NSIndexSet)

    @objc(removeUserAtIndexes:)
    @NSManaged public func removeFromUser(at indexes: NSIndexSet)

    @objc(replaceObjectInUserAtIndex:withObject:)
    @NSManaged public func replaceUser(at idx: Int, with value: User)

    @objc(replaceUserAtIndexes:withUser:)
    @NSManaged public func replaceUser(at indexes: NSIndexSet, with values: [User])

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: User)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: User)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSOrderedSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSOrderedSet)

}
