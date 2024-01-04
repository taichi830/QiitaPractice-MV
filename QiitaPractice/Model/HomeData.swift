//
//  HomeData.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/02.
//

import Foundation

@Observable
final class HomeData {
    var isLoading = false
    var error: Error?
    var items: [ItemsResponse]?
    let itemsRequest = ItemsRequest()
    
    func fetchItems() {
        isLoading = true
        Task {
            do {
                items = try await itemsRequest.send(with: .init())
                isLoading = false
            } catch {
                self.error = error
                isLoading = false
            }
        }
    }
}
