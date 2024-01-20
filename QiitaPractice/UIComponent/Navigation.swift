//
//  Navigation.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/01.
//

import SwiftUI

struct Navigation<Content: View>: View {
    @StateObject var router: Router
    private let content: Content
    
    init(router: Router, @ViewBuilder content: () -> Content) {
        self._router = .init(wrappedValue: router)
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Router.Route.self){ route in
                    router.view(for: route, type: .navigation)
                }
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color.green, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .sheet(item: $router.presentingSheet) { route in
            router.view(for: route, type: .sheet)
        }
        .fullScreenCover(item: $router.presentingFullScreenCover) { route in
            router.view(for: route, type: .fullScreenCover)
        }
        .environmentObject(router)
    }
}
