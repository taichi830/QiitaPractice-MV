//
//  HomeView.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/01.
//

import SwiftUI
import Dependencies

struct HomeView: View {
    @StateObject var homeData: HomeData
    @EnvironmentObject var router: Router
    
    var body: some View {
        ItemList(items: homeData.items) { item in
            router.presentFullScreen(.detail(input: item.articleURL))
        }
        .navigationTitle("QiitaPractice")
        .navigationBarTitleDisplayMode(.large)
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
