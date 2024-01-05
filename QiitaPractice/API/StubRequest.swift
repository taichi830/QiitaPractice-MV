//
//  StubRequest.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/05.
//

import Foundation

class StubRequest {
    func requestJson<T: CustomDecodabel>(with path: String) async throws -> T {
        let path = Bundle.main.url(forResource: path, withExtension: "json")!
        let jsonData = try Data(contentsOf: path)
        return try await withCheckedThrowingContinuation { continuation in
            do {
                let response = try T.decoder.decode(T.self, from: jsonData)
                return continuation.resume(returning: response)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}

extension GetRequestable where Self: StubRequest {
    func send(with parameter: Parameter) async throws -> Response {
        try await get(parameter: parameter)
    }
}
