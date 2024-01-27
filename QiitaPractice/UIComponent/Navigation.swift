//
//  Navigation.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/01.
//

import SwiftUI

struct Navigation<Content: View, Destination: Routable>: View {
    @StateObject var router: Router<Destination> = .init(isPresented: .constant(.none))
    private let rootContent: (Router<Destination>) -> Content
    
    init(_ routeType: Destination.Type, @ViewBuilder content: @escaping (Router<Destination>) -> Content) {
        self.rootContent = content
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            rootContent(router)
                .navigationDestination(for: Destination.self) { route in
                    router.view(for: route)
                }
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color.green, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .sheet(item: $router.presentingSheet) { route in
            router.view(for: route)
        }
        .fullScreenCover(item: $router.presentingFullScreenCover) { route in
            router.view(for: route)
        }
        .environmentObject(router)
    }
}
