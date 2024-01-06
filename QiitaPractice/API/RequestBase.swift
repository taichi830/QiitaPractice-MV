//
//  RequestBase.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2023/12/31.
//

import Foundation
import Alamofire

class RequestBase {
    func requestJson<T: CustomDecodabel>(host: String, path: String, method: HTTPMethod, parameter: Encodable) async throws -> T {
        let url = buildURL(host: host, path: path)
        let result = await AF.request(url, method: method, parameters: parameter).serializingDecodable(T.self, decoder: T.decoder).result
        
        switch result {
        case .success(let data):
            return data
            
        case .failure(let error):
            guard let errorCode = error.responseCode else { throw error }
            let connectingError = ConnectionError(errorCode: errorCode)
            throw connectingError
        }
    }
    
    private func buildURL(host: String, path: String) -> URL {
        return URL(string: host)!.appendingPathComponent(path)
    }
}
