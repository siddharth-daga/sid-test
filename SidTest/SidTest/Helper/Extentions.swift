//
//  Extentions.swift
//  SidTest
//
//  Created by Backup on 20/07/20.
//  Copyright © 2020 Backup. All rights reserved.
//

import UIKit

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension UITableView {
    func registerNibs(identifiers: [CellIdentifiers]) {
        for identifier in identifiers {
            self.register(UINib(nibName: identifier.rawValue, bundle: nil), forCellReuseIdentifier: identifier.rawValue)
        }
    }
}

extension UIImageView {
    func loadImage(urlString: String?, placeholderImage: UIImage? = nil) {
        let imageUrl = urlString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        self.sd_setImage(with: URL(string: imageUrl ?? ""), placeholderImage: nil, options: [.scaleDownLargeImages], completed: nil)
        self.sd_imageTransition = .fade
    }
}

extension UIView {
    func addCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}

