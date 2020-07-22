//
//  ArticleListingCellViewModel.swift
//  SidTest
//
//  Created by Siddharth Daga on 20/07/20.
//  Copyright © 2020 Siddharth Daga. All rights reserved.
//

import UIKit

class ArticleListingCellViewModel: ArticleListingCellPresentable {
    
    var imgUserUrl: String?
    var time: String?
    var userName: String?
    var userDesignation: String?
    var imgArticleUrl: String?
    var articleContent: String?
    var articleTitle: String?
    var articleUrl: NSMutableAttributedString?
    var articleLikesCount: String?
    var articleCommentsCount: String?
    weak var delegate: UpdateViewModel?
    var indexPath: IndexPath?
    var cellHeight: CGFloat = UITableView.automaticDimension
    
    init(delegate: UpdateViewModel?, article: Article?) {
        self.delegate = delegate
        
        let user = article?.user?.array.first as? User
        imgUserUrl = user?.avatar
        let timeDate = article?.createdAt?.toDate(dateFormat: .dateFormat1)
        time = timeDate?.timeAgoSince()
        userName = "\(user?.name ?? "") \(user?.lastname ?? "")"
        userDesignation = user?.designation
        
        let media = article?.media?.array.first as? Media
        imgArticleUrl = media?.image
        articleContent = article?.content
        articleTitle = media?.title
        
        let str: NSMutableAttributedString = NSMutableAttributedString(string: media?.url ?? "", type: .regular, size: 14.0, textColor: .black)
        str.addAttribute(NSAttributedString.Key.link, value: media?.url ?? "", range: NSRange(location: 0, length: str.length))
        articleUrl = str
        articleLikesCount = "\(article?.likes.formatUsingAbbrevation() ?? "0") Likes"
        articleCommentsCount = "\(article?.comments.formatUsingAbbrevation() ?? "0") Comments"
    }
}

protocol ArticleListingCellPresentable {
    var imgUserUrl: String? {get}
    var time: String? {get}
    var userName: String? {get}
    var userDesignation: String? {get}
    var imgArticleUrl: String? {get}
    var articleContent: String? {get}
    var articleTitle: String? {get}
    var articleUrl: NSMutableAttributedString? {get}
    var articleLikesCount: String? {get}
    var articleCommentsCount: String? {get}
}
