//
//  AricleListingModels.swift
//  SidTest
//
//  Created by Backup on 20/07/20.
//  Copyright © 2020 Backup. All rights reserved.
//

import Foundation
import CoreData

// MARK: - ArticleListingResponse
struct ArticleListingResponse: Codable {
    let id, createdAt, content: String?
    let comments, likes: Int?
    let media: [MediaCodable]?
    let user: [UserCodable]?
}

// MARK: - Media
struct MediaCodable: Codable {
    let id, blogId, createdAt: String?
    let image: String?
    let title: String?
    let url: String?
}

// MARK: - User
struct UserCodable: Codable {
    let id, blogId, createdAt, name: String?
    let avatar: String?
    let lastname, city, designation, about: String?
}

