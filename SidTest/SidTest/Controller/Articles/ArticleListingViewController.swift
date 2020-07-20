//
//  ArticleListingViewController.swift
//  SidTest
//
//  Created by Backup on 20/07/20.
//  Copyright © 2020 Backup. All rights reserved.
//

import UIKit

class ArticleListingViewController: BaseViewController {

    @IBOutlet weak var tblArticleListing: UITableView?
    
    let viewModel = ArticleListingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
