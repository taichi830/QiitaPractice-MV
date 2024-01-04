//
//  QiitaError.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2023/12/31.
//

import Foundation

struct QiitaError: Error {
    var message: String = ""
    
    init?(error: Any) {
        guard let dic = error as? [String: Any] else { return nil }
        guard let originMessage = dic["error"] as? String else { return nil }
        
        switch originMessage {
        default:
            message = "エラーが発生しました"
        }
    }
}
