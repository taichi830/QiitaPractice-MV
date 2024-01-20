//
//  Router.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/07.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    enum NavigationType {
        case navigation
        case sheet
        case fullScreenCover
    }
    
    enum Route: Hashable, Identifiable {
        var id: Self {
            return self
        }
        case detail(input: URL)
    }
    
    @Published var path: NavigationPath = NavigationPath()
    @Published var presentingSheet: Route?
    @Published var presentingFullScreenCover: Route?
    
    @Published var isPresented: Binding<Route?>
    
    init(isPresented: Binding<Route?>) {
        self.isPresented = isPresented
    }
    
    @ViewBuilder func view(for route: Route, type: NavigationType) -> some View {
        switch route {
        case .detail(let url):
            ItemDetail(url: url)
        }
    }
    
    func router(navigationType: NavigationType) -> Router {
        switch navigationType {
        case .navigation:
            return self
        case .sheet:
            return Router(
                isPresented: .init(
                    get: { self.presentingSheet },
                    set: { self.presentingSheet = $0 }
                )
            )
        case .fullScreenCover:
            return Router(
                isPresented: .init(
                    get: { self.presentingFullScreenCover },
                    set: { self.presentingFullScreenCover = $0 }
                )
            )
        }
    }
    
    func presentSheet(_ route: Route) {
        presentingSheet = route
    }
    
    func presentFullScreen(_ route: Route) {
        presentingFullScreenCover = route
    }
    
    func navigationTo(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    func navigationBack() {
        path.removeLast()
    }
}
