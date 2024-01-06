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
        do {
            return try T.decoder.decode(T.self, from: jsonData)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
