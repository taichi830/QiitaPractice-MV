//
//  ItemList.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/02.
//

import SwiftUI

struct ItemList<Entity: ItemEntity>: View {
    private let items: [Entity]
    private let selectAction: (Entity) -> Void
    private let favoriteAction: () -> Void
    
    init(
        items: [Entity],
        action: @escaping (Entity) -> Void,
        favoriteAction: @escaping () -> Void
    ) {
        self.items = items
        self.selectAction = action
        self.favoriteAction = favoriteAction
    }
    
    var body: some View {
        List(items) { item in
            VStack(spacing: 0) {
                ItemCell(item: item) {
                    favoriteAction()
                }
                .padding()
            }
            .listRowInsets(EdgeInsets())
            .onTapGesture {
                selectAction(item)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    struct MockEntity: ItemEntity {
        var id = "id"
        var title =  "title"
        var userName = "userName"
        var userImageURL: URL = URL(string: "https://i.gyazo.com/43ef3dfee7b402b1582db2ce241731f5.png")!
        var articleURL: URL = URL(string: "url")!
        var createdAt = "2024年1月1日"
        var updatedAt: String? = "2023年1月2日"
    }
    
    let entities = Array(repeating: MockEntity(), count: 5)
    
    return ItemList(
        items: entities,
        action: { _ in },
        favoriteAction: {}
    )
}
