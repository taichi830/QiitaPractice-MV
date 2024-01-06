//
//  ItemsRequest.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2023/12/30.
//

import Foundation
import Alamofire

protocol ItemsRequestable: GetRequestable {
    associatedtype Parameter = ItemsParameter
    associatedtype Response = [ItemsResponse]
}

extension ItemsRequestable {
    typealias Parameter = ItemsParameter
    typealias Response = [ItemsResponse]
    
    var host: String { "https://qiita.com" }
    var path: String { "/api/v2/items" }
}

final class ItemsRequest: RequestBase, ItemsRequestable {}

typealias AnyItemRequest = AnyRequest<ItemsParameter, [ItemsResponse]>
