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
        
    }
}
