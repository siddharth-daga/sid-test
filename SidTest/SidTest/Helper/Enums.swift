//
//  Enums.swift
//  SidTest
//
//  Created by Backup on 20/07/20.
//  Copyright © 2020 Backup. All rights reserved.
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
