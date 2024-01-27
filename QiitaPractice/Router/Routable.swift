//
//  Routable.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/20.
//

import SwiftUI

enum NavigationType {
    case push
    case sheet
    case fullScreenCover
}

protocol Routable: Hashable, Identifiable {
    associatedtype ViewType: View
    var navigationType: NavigationType { get }
    func viewToDisplay(router: Router<Self>) -> ViewType
}

extension Routable {
    public var id: Self { self }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
