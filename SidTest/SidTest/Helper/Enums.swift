//
//  Enums.swift
//  SidTest
//
//  Created by Siddharth Daga on 20/07/20.
//  Copyright © 2020 Siddharth Daga. All rights reserved.
//

import Foundation

enum RequestResourceType {
    case getArticleListing
    case none
}

enum ParameterKeys: String {
    case baseUrl = "{{base_url}}"
    case pageNo = "{{page_no}}"
}

enum UpdateViewModelIdentifier {
    case none
}

enum CellIdentifiers: String {
    case articleListingTableViewCell = "ArticleListingTableViewCell"
}

enum DateFormats: String {
    case dateFormat1 = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
}

enum FontTypeEnum {
    case regular
    case bold
}
