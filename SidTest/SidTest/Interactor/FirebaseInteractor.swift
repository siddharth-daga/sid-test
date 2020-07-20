//
//  FirebaseInteractor.swift
//  SidTest
//
//  Created by Backup on 20/07/20.
//  Copyright © 2020 Backup. All rights reserved.
//

import Foundation

struct FireBaseConfig:Codable {
    static var shared: FireBaseConfig = FireBaseConfig()
    var baseUrl: String? = "https://5e99a9b1bc561b0016af3540.mockapi.io"
    var getArticleListingApi: String? = "{{base_url}}/jet2/api/v1/blogs?page={{page_no}}&limit=10"
}
