//
//  HomeView.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/01.
//

import SwiftUI

struct HomeView: View {
    @State var path = NavigationPath()
    private let homeData = HomeData()
    
    var body: some View {
        Navigation(path: $path) {
            if let items = homeData.items {
                ItemList(items: items) { _ in
                    path.append(0)
                }
                .navigationTitle("QiitaPractice")
                .navigationBarTitleDisplayMode(.large)
                .navigationDestination(for: Int.self) { appended in
                    Text("next page")
                }
            }
        }
        .onAppear {
            homeData.fetchItems()
        }
    }
}

#Preview {
    HomeView()
}
