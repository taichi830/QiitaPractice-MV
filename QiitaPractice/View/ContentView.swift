//
//  ContentView.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2023/12/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Navigation(HomeRoute.self) { router in
            HomeView(homeData: HomeData(), router: router)
        }
    }
}

#Preview {
    ContentView()
}
