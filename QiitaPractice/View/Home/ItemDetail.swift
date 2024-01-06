//
//  ArticleDetail.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/06.
//

import SwiftUI
import SafariServices

struct ItemDetail: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    
    var url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.dismissButtonStyle = .close
        
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

#Preview {
    let url = URL(string: "https://qiita.com/yimajo/items/791dc1c1693d9821c5a8")!
    return ItemDetail(url: url)
}
