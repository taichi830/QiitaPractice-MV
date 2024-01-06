//
//  Requestable.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2023/12/30.
//

import Foundation
import Alamofire

protocol Requestable {
    associatedtype Parameter: Encodable
    associatedtype Response: CustomDecodabel
    
    func send(with parameter: Parameter) async throws -> Response
}

protocol AFRequestable: Requestable {
    var host: String { get } // https://qiita.com/api/v2/items の https://qiita.com の部分
    var path: String { get } // https://qiita.com/api/v2/items の /api/v2/items の部分
}

// GET Request
protocol GetRequestable: AFRequestable {}

extension GetRequestable where Self: RequestBase {
    func send(with parameter: Parameter) async throws -> Response {
        try await requestJson(host: host, path: path, method: .get, parameter: parameter)
    }
}
