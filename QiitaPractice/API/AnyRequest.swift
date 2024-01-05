//
//  AnyRequest.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/05.
//

import Foundation

struct AnyRequest<Prameter: Encodable, Response: CustomDecodabel>: Requestable {
    public init<Base: Requestable>(_ base: Base) where Base.Parameter == Parameter, Base.Response == Response {
        _send = base.send
    }
    
    func send(with parameter: Prameter) async throws -> Response {
        try await _send(parameter)
    }
    
    private var _send: (Parameter) async throws -> Response
}
