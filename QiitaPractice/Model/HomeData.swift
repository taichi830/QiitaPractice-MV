//
//  HomeData.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/02.
//

import Foundation
import Dependencies

@MainActor
final class HomeData: ObservableObject {
    @ObservationIgnored
    @Dependency(\.itemRequest) var itemRequest
    
    @Published var isLoading = false
    @Published var error: Error?
    @Published var items: [ItemsResponse] = []
    
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
