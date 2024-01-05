//
//  DependencyInjection.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/04.
//

import Foundation
import Dependencies

private enum ItemRequestKey: DependencyKey {
    static var liveValue: AnyItemRequest = .init(ItemsRequest())
    static var previewValue: AnyItemRequest = .init(StubItemRequest())
}

extension DependencyValues {
    var itemRequest: AnyItemRequest {
        get { self[ItemRequestKey.self]}
        set { self[ItemRequestKey.self] = newValue }
    }
}
