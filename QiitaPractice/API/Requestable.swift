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
    var method: HTTPMethod { get }
}

// GET Request
protocol GetRequestable: AFRequestable {
    func get(parameter: Parameter) async throws -> Response
}

// TODO: ここ共通化したい
extension GetRequestable where Self: AFRequestable {
    func get(parameter: Parameter) async throws -> Response {
        let url = buildURL(host: self.host, path: self.path)
        let request = AF.request(url, method: self.method, parameters: parameter)
        return try await withCheckedThrowingContinuation { continuation in
            request.response { response in
                switch response.result {
                case .success(let data):
                    do {
                        guard let data = data else { return }
                        let decoded = try Response.decoder.decode(Response.self, from: data)
                        continuation.resume(returning: decoded)
                    } catch {
                        // TODO: ErrorLOG
                        guard let data = data, let error = QiitaError(error: data) else { return }
                        continuation.resume(throwing: error)
                    }
                    
                case .failure(let error):
                    guard let errorCode = error.responseCode else { return }
                    let connectingError = ConnectionError(errorCode: errorCode)
                    continuation.resume(throwing: connectingError)
                }
            }
        }
    }
    
    func send(with parameter: Parameter) async throws -> Response {
        try await get(parameter: parameter)
    }
    
    private func buildURL(host: String, path: String) -> URL {
        return URL(string: host)!.appendingPathComponent(path)
    }
}
