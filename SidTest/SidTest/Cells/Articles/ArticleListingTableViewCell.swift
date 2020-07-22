//
//  ArticleListingTableViewCell.swift
//  SidTest
//
//  Created by Siddharth Daga on 20/07/20.
//  Copyright © 2020 Siddharth Daga. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleListingTableViewCell: BaseTableViewCell {

    @IBOutlet weak var imgUser: UIImageView?
    @IBOutlet weak var lblTime: UILabel?
    @IBOutlet weak var lblUserName: UILabel?
    @IBOutlet weak var lblUserDesignation: UILabel?
    @IBOutlet weak var imgArticle: UIImageView?
    @IBOutlet weak var lblArticleContent: UILabel?
    @IBOutlet weak var lblArticleTitle: UILabel?
    @IBOutlet weak var textViewArticleUrl: UITextView?
    @IBOutlet weak var textViewArticleUrlHeightConstraint: NSLayoutConstraint?
    @IBOutlet weak var lblArticleLikesCount: UILabel?
    @IBOutlet weak var lblArticleCommentsCount: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgUser?.addCornerRadius(radius: (imgUser?.bounds.height ?? 60.0)/2.0)
        imgUser?.addBorder()
        imgArticle?.addBorder()
    }

    override func setupCell<T>(viewPresentable: T) {
        if let viewPresentable = viewPresentable as? ArticleListingCellPresentable {
            imgUser?.loadImage(urlString: viewPresentable.imgUserUrl)
            lblTime?.text = viewPresentable.time
            lblUserName?.text = viewPresentable.userName
            lblUserDesignation?.text = viewPresentable.userDesignation
            imgArticle?.loadImage(urlString: viewPresentable.imgArticleUrl)
            lblArticleContent?.text = viewPresentable.articleContent
            lblArticleTitle?.text = viewPresentable.articleTitle
            textViewArticleUrl?.attributedText = viewPresentable.articleUrl
            lblArticleLikesCount?.text = viewPresentable.articleLikesCount
            lblArticleCommentsCount?.text = viewPresentable.articleCommentsCount
            
            let fixedWidth = textViewArticleUrl?.frame.size.width ?? .zero
            let newSize = textViewArticleUrl?.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude)) ?? CGSize()
            textViewArticleUrlHeightConstraint?.constant = newSize.height
        }
    }
}
