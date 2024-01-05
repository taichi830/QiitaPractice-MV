//
//  StubItemRequest.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/05.
//

import Foundation

final class StubItemRequest: StubRequest, ItemsRequestable {
    func get(parameter: ItemsParameter) async throws -> [ItemsResponse] {
        try await requestJson(with: "items")
    }
}
