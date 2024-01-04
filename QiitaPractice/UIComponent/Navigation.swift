//
//  Navigation.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/01.
//

import SwiftUI

struct Navigation<Content: View>: View {
    @Binding var path: NavigationPath
    private let content: Content
    
    init(path: Binding<NavigationPath>, @ViewBuilder content: () -> Content) {
        self._path = path
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            content
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color.green, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}
