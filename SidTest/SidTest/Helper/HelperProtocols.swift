//
//  HelperProtocols.swift
//  SidTest
//
//  Created by Backup on 20/07/20.
//  Copyright © 2020 Backup. All rights reserved.
//

import Foundation
import UIKit

protocol UpdateBaseViewController: class {
    func showLoadingInView()
    func hideLoadingInView()
}

protocol UpdateViewController: UpdateBaseViewController {
    func reloadTable()
}

extension UpdateViewController {
    func reloadTable() {}
}

extension UpdateBaseViewController {
    func showLoadingInView() {}
    func hideLoadingInView() {}
}

protocol BaseViewModel: class {
    func cellInstanceTableView(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func cellInstanceCollectionView(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}

extension BaseViewModel {
    func cellInstanceTableView(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func cellInstanceCollectionView(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

protocol UpdateViewModel:class {
    func updateFromCell(identifier: UpdateViewModelIdentifier, indexPath: IndexPath?)
}

extension UpdateViewModel {
    func updateFromCell(identifier: UpdateViewModelIdentifier, indexPath: IndexPath?) {}
}

protocol CellConfigurable {
    func setupCell<T>(viewPresentable: T) // Provide a generic function
}
