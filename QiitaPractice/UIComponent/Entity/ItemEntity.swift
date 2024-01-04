//
//  ItemEntity.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/02.
//

import Foundation

protocol ItemEntity: Identifiable {
    var id: String { get }
    var title: String { get }
    var userName: String { get }
    var userImageURL: URL { get }
    var articleURL: URL { get }
    var createdAt: String { get }
    var updatedAt: String? { get }
}
