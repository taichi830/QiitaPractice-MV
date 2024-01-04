//
//  ItemsResponse+Entity.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/02.
//

import Foundation

extension ItemsResponse: ItemEntity {
    var articleURL: URL {
        URL(string: url)!
    }
    
    var userImageURL: URL {
        URL(string: user.profile_image_url)!
    }
    
    var createdAt: String {
        created_at.long
    }
    
    var updatedAt: String? {
        updated_at?.long
    }
    
    var image: String {
        user.profile_image_url
    }
    
    var userName: String {
        user.name
    }
}
