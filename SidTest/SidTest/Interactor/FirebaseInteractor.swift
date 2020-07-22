//
//  FirebaseInteractor.swift
//  SidTest
//
//  Created by Siddharth Daga on 20/07/20.
//  Copyright © 2020 Siddharth Daga. All rights reserved.
//

import Foundation

struct FireBaseConfig:Codable {
    static var shared: FireBaseConfig = FireBaseConfig()
    var baseUrl: String? = "https://5e99a9b1bc561b0016af3540.mockapi.io"
    var getArticleListingApi: String? = "{{base_url}}/jet2/api/v1/blogs?page={{page_no}}&limit=10"
}
