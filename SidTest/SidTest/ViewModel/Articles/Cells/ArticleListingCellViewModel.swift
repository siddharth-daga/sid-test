//
//  ArticleListingCellViewModel.swift
//  SidTest
//
//  Created by Backup on 20/07/20.
//  Copyright © 2020 Backup. All rights reserved.
//

import Foundation

class ArticleListingCellViewModel: ArticleListingCellPresentable {
    
    var imgUserUrl: String?
    var userName: String?
    var userDesignation: String?
    var imgArticleUrl: String?
    var articleContent: String?
    var articleTitle: String?
    var articleUrl: String?
    var articleLikesCount: String?
    var articleCommentsCount: String?
    weak var delegate: UpdateViewModel?
    var indexPath: IndexPath?
    
    init(delegate: UpdateViewModel?, article: ArticleListingResponse?) {
        self.delegate = delegate
        
        let user = article?.user?.first
        imgUserUrl = user?.avatar
        userName = "\(user?.name ?? "") \(user?.lastname ?? "")"
        userDesignation = user?.designation
        
        let media = article?.media?.first
        imgArticleUrl = media?.image
        articleContent = article?.content
        articleTitle = media?.title
        articleUrl = media?.url
        articleLikesCount = "\(article?.likes ?? 0) Likes"
        articleCommentsCount = "\(article?.comments ?? 0) Comments"
    }
}

protocol ArticleListingCellPresentable {
    var imgUserUrl: String? {get}
    var userName: String? {get}
    var userDesignation: String? {get}
    var imgArticleUrl: String? {get}
    var articleContent: String? {get}
    var articleTitle: String? {get}
    var articleUrl: String? {get}
    var articleLikesCount: String? {get}
    var articleCommentsCount: String? {get}
}
