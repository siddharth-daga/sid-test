//
//  ArticleListingViewModel.swift
//  SidTest
//
//  Created by Backup on 20/07/20.
//  Copyright © 2020 Backup. All rights reserved.
//

import UIKit

class ArticleListingViewModel: BaseViewModel {

    weak var delegate: UpdateViewController?
    var cellViewModels: [ArticleListingCellViewModel] = []
    var pageNo: Int = 1
    var isListEndReached: Bool = true
    
    func fetchArticleListingData() {
        let parameters: [ParameterKeys: String] = [ParameterKeys.pageNo: "\(pageNo)"]
        let interactor = ServiceInteractor(resourceType: .getArticleListing, params: parameters)
        interactor.getResult(object: [ArticleListingResponse].self) { [weak self] (response, error) in
            if let response = response as? [ArticleListingResponse] {
                self?.setupCellViewModels(articles: response)
            }
        }
    }
    
    func setupCellViewModels(articles: [ArticleListingResponse]) {
        if pageNo == 1 {
            cellViewModels.removeAll()
        }
        
        for article in articles {
            let cellViewModel = ArticleListingCellViewModel(delegate: self, article: article)
            cellViewModels.append(cellViewModel)
        }
        
        if articles.count < 10 {
            isListEndReached = true
        } else {
            isListEndReached = false
        }
        
        delegate?.reloadTable()
        delegate?.hideLoadingInView()
    }
    
    func cellInstanceTableView(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        if let cellViewModel = cellViewModels[safe: indexPath.row] {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.articleListingTableViewCell.rawValue, for: indexPath) as? ArticleListingTableViewCell
            cell?.setupCell(viewPresentable: cellViewModel)
            return cell ?? UITableViewCell()
        }
        
        return UITableViewCell()
    }
}

extension ArticleListingViewModel: UpdateViewModel {}
