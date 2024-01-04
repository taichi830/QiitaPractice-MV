//
//  CustomDecodabel.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/03.
//

import Foundation

protocol CustomDecodabel: Decodable {
    static var decoder: JSONDecoder { get }
}

extension CustomDecodabel {
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            if let date = ISO8601DateFormatter().date(from: dateString) {
                return date
            }
            
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateString)")
        }
        
        return decoder
    }
}

extension Array: CustomDecodabel where Element: CustomDecodabel {
    static var decoder: JSONDecoder {
        return Element.decoder
    }
}
