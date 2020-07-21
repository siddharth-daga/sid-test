//
//  ArticleListingViewModel.swift
//  SidTest
//
//  Created by Backup on 20/07/20.
//  Copyright © 2020 Backup. All rights reserved.
//

import UIKit
import CoreData

class ArticleListingViewModel: BaseViewModel {

    weak var delegate: UpdateViewController?
    var cellViewModels: [ArticleListingCellViewModel] = []
    var pageNo: Int = 1
    var isListEndReached: Bool = true
    let container: NSPersistentContainer = NSPersistentContainer(name: "SidTest")
    
    func loadContainer() {
        // load the database if it exists, if not create it.
        container.loadPersistentStores { storeDescription, error in
            // resolve conflict by using correct NSMergePolicy
            self.container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
        
        self.loadSavedData()
    }
    
    func fetchArticleListingData() {
        let parameters: [ParameterKeys: String] = [ParameterKeys.pageNo: "\(pageNo)"]
        let interactor = ServiceInteractor(resourceType: .getArticleListing, params: parameters)
        interactor.getResult(object: [Article].self) { [weak self] (response, error) in
            guard let data = response else { return }
            do {
                let decoder = JSONDecoder()
                decoder.userInfo[CodingUserInfoKey.context!] = self?.container.viewContext
                let _ = try decoder.decode([Article].self, from: data)
                
                // Move back on the main thread, as we call tableview.reload
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {return}
                    self.saveContext()
                    self.loadSavedData()
                }
            } catch let err {
                print("Err", err)
            }
        }
    }
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try self.container.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
    
    func loadSavedData() {
        let request: NSFetchRequest<Article> = Article.fetchRequest()
        let sort = NSSortDescriptor(key: "id", ascending: false)
        request.sortDescriptors = [sort]
        
        do {
            // fetch is performed on the NSManagedObjectContext
            let articles = try self.container.viewContext.fetch(request)
            if articles.count == 0 {
                self.fetchArticleListingData()
            } else {
                self.setupCellViewModels(articles: articles)
            }
        } catch {
            print("Fetch failed")
        }
    }
    
    func setupCellViewModels(articles: [Article]) {
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
