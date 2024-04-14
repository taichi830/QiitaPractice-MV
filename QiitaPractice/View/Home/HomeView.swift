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
    @StateObject var router: Router<HomeRoute>
    
    init(homeData: HomeData, router: Router<HomeRoute>) {
        _homeData = StateObject(wrappedValue: homeData)
        _router = StateObject(wrappedValue: router)
    }
    
    var body: some View {
        ItemList(
            items: homeData.items,
            action: { item in
                router.routeTo(.detail(item.articleURL))
            },
            favoriteAction: {
                print("favorite")
            }
        )
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
        }, 
        router: .init(isPresented: .constant(.none))
    )
}
