//
//  ContentView.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2023/12/16.
//

import SwiftUI

struct ContentView: View {
    let router: Router = Router(isPresented: .constant(.none))
    var body: some View {
        Navigation(router: router) {
            HomeView(homeData: HomeData())
        }
    }
}

#Preview {
    ContentView()
}
