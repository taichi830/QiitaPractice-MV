//
//  Router.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/07.
//

import Foundation
import SwiftUI

class Router<Destination: Routable>: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var presentingSheet: Destination?
    @Published var presentingFullScreenCover: Destination?
    @Published var isPresented: Binding<Destination?>
    
    init(isPresented: Binding<Destination?>) {
        self.isPresented = isPresented
    }
    
    @ViewBuilder func view(for route: Destination) -> some View {
        route.viewToDisplay(router: router(navigationType: route.navigationType))
    }
    
    func routeTo(_ route: Destination) {
        switch route.navigationType {
        case .push:
            push(route)
        case .sheet:
            presentSheet(route)
        case .fullScreenCover:
            presentFullScreen(route)
        }
    }
    
    func router(navigationType: NavigationType) -> Router {
        switch navigationType {
        case .push:
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
    
    func push(_ appRoute: Destination) {
        path.append(appRoute)
    }
    
    func presentSheet(_ route: Destination) {
        presentingSheet = route
    }
    
    func presentFullScreen(_ route: Destination) {
        presentingFullScreenCover = route
    }
    
    func dismiss() {
        if !path.isEmpty {
            path.removeLast()
        } else if presentingSheet != nil {
            presentingSheet = nil
        } else if presentingFullScreenCover != nil {
            presentingFullScreenCover = nil
        } else {
            isPresented.wrappedValue = nil
        }
    }
}
