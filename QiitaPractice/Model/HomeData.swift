//
//  HomeData.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/02.
//

import Foundation
import Dependencies

@MainActor
@Observable
final class HomeData {
    @ObservationIgnored
    @Dependency(\.itemRequest) var itemRequest
    
    var isLoading = false
    var error: Error?
    var items: [ItemsResponse]?
    
    func fetchItems() {
        isLoading = true
        Task {
            do {
                items = try await itemRequest.send(with: .init())
                isLoading = false
            } catch {
                self.error = error
                isLoading = false
            }
        }
    }
}
