//
//  BaseTableViewCell.swift
//  SidTest
//
//  Created by Siddharth Daga on 20/07/20.
//  Copyright © 2020 Siddharth Daga. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell, CellConfigurable {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setupCell<T>(viewPresentable: T) {}
}
