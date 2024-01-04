//
//  ConnectionError.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2023/12/31.
//

import Foundation

struct ConnectionError: Error {
    var message: String
    
    init(errorCode: Int) {
        
        switch errorCode {
        case -1001:
            message = "通信がタイムアウトしました。電波環境の良い場所で再度お試しください"
        case -1009:
            message = "ネットワークに接続されていません"
        default:
            message = "通信エラーが発生しました"
        }
    }
}
