//
//  HomeView.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/01.
//

import SwiftUI
import Dependencies

struct HomeView: View {
    @State var path = NavigationPath()
    let homeData: HomeData
    
    var body: some View {
        Navigation(path: $path) {
            if let items = homeData.items {
                ItemList(items: items) { item in
                    path.append(item)
                }
                .navigationTitle("QiitaPractice")
                .navigationBarTitleDisplayMode(.large)
                .navigationDestination(for: ItemsResponse.self) { appended in
                    ItemDetail(url: appended.articleURL)
                        .navigationBarHidden(true)
                }
            }
        }
        .onAppear {
            homeData.fetchItems()
        }
    }
}

#Preview {
    HomeView(
        homeData: withDependencies {
            $0 = .preview
          } operation: {
            HomeData()
          }
    )
}
