//
//  ItemsParameter.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2023/12/30.
//

import Foundation

struct ItemsParameter: Encodable {
    var page: String?
    var per_page: String?
    var query: String?
    
    init(
        page: String? = nil,
        per_page: String? = nil,
        query: String? = nil
    ) {
        self.page = page
        self.per_page = per_page
        self.query = query
    }
}
