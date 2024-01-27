//
//  HomeRoute.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/20.
//

import SwiftUI

enum HomeRoute: Routable {
    case detail(_ url: URL)
    
    @ViewBuilder
    func viewToDisplay(router: Router<Self>) -> some View {
        switch self {
        case .detail(let url):
            ItemDetail(url: url)
        }
    }
    
    var navigationType: NavigationType {
        switch self {
        case .detail:
            return .fullScreenCover
        }
    }
}
