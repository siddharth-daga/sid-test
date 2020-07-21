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
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.title = "Articles"
        activityIndicator.hidesWhenStopped = true
        tblArticleListing?.tableFooterView = activityIndicator
        tblArticleListing?.registerNibs(identifiers: [.articleListingTableViewCell])
        setupViewModel()
    }
    
    func setupViewModel() {
        self.showLoadingInView()
        viewModel.delegate = self
        viewModel.loadContainer()
    }
}

extension ArticleListingViewController: UpdateViewController {
    func reloadTable() {
        OperationQueue.main.addOperation {
            self.hideLoadingInView()
            self.activityIndicator.stopAnimating()
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        /*if viewModel.isListEndReached == false && (indexPath.row == viewModel.cellViewModels.count - 1) {
            activityIndicator.startAnimating()
            viewModel.pageNo += 1
            viewModel.fetchArticleListingData()
        } else {
            tblArticleListing?.tableFooterView = UIView()
        }*/
    }
}
