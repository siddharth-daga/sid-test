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
        setupUI()
    }
    
    func setupUI() {
        self.title = "Articles"
        tblArticleListing?.tableFooterView = UIView()
        tblArticleListing?.registerNibs(identifiers: [.articleListingTableViewCell])
        setupViewModel()
    }
    
    func setupViewModel() {
        viewModel.delegate = self
        viewModel.fetchArticleListingData()
    }
}

extension ArticleListingViewController: UpdateViewController {
    func reloadTable() {
        OperationQueue.main.addOperation {
            self.tblArticleListing?.reloadData()
        }
    }
}

extension ArticleListingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellInstanceTableView(tableView, indexPath: indexPath)
    }
}

