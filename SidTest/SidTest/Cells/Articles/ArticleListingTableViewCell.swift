//
//  ArticleListingTableViewCell.swift
//  SidTest
//
//  Created by Backup on 20/07/20.
//  Copyright © 2020 Backup. All rights reserved.
//

import UIKit

class ArticleListingTableViewCell: BaseTableViewCell {

    @IBOutlet weak var imgUser: UIImageView?
    @IBOutlet weak var lblUserName: UILabel?
    @IBOutlet weak var lblUserDesignation: UILabel?
    @IBOutlet weak var imgArticle: UIImageView?
    @IBOutlet weak var lblArticleContent: UILabel?
    @IBOutlet weak var lblArticleTitle: UILabel?
    @IBOutlet weak var lblArticleUrl: UILabel?
    @IBOutlet weak var lblArticleLikesCount: UILabel?
    @IBOutlet weak var lblArticleCommentsCount: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setupCell<T>(viewPresentable: T) {
        if let viewPresentable = viewPresentable as? ArticleListingCellPresentable {
            lblUserName?.text = viewPresentable.userName
            lblUserDesignation?.text = viewPresentable.userDesignation
            lblArticleContent?.text = viewPresentable.articleContent
            lblArticleTitle?.text = viewPresentable.articleTitle
            lblArticleUrl?.text = viewPresentable.articleUrl
            lblArticleLikesCount?.text = viewPresentable.articleLikesCount
            lblArticleCommentsCount?.text = viewPresentable.articleCommentsCount
        }
    }
}
