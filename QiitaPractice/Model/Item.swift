//
//  Item.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/05.
//

import Foundation

struct Item: CustomDecodabel {
    var created_at: Date
    var id: String
    var title: String
    var updated_at: Date?
    var url: String
    var user: User
    
    init(
        created_at: Date,
        id: String,
        title: String,
        updated_at: Date? = nil,
        url: String,
        user: User
    ) {
        self.created_at = created_at
        self.id = id
        self.title = title
        self.updated_at = updated_at
        self.url = url
        self.user = user
    }
    
    struct User: CustomDecodabel {
        var name: String
        var profile_image_url: String
    }
}
