//
//  ItemCell.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/02.
//

import SwiftUI
import Kingfisher

struct ItemCell<Entity: ItemEntity>: View {
    let item: Entity
    
    init(item: Entity) {
        self.item = item
    }
    
    var body: some View {
        HStack(alignment: .top) {
            KFImage(item.userImageURL)
                .resizable()
                .frame(width: 30, height: 30)
                .background(Color.blue)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text(item.userName)
                    .font(.caption)
                    .lineLimit(1)
                Text(item.createdAt)
                    .font(.caption)
                    .lineLimit(1)
                Text(item.title)
                    .font(.title3)
                    .fontWeight(.medium)
                    .lineLimit(2)
            }
            
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    struct MockEntity: ItemEntity {
        var id = "id"
        var title =  "title"
        var userName = "userName"
        var userImageURL: URL = URL(string: "https://i.gyazo.com/43ef3dfee7b402b1582db2ce241731f5.png")!
        var articleURL: URL = URL(string: "url")!
        var createdAt = "2024年1月1日"
        var updatedAt: String? = "2023年1月2日"
    }
    
    return ItemCell(item: MockEntity())
        .padding()
}
