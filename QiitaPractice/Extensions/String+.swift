//
//  String+.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2023/12/31.
//

import Foundation

extension String {
    func appendPath(path: String) -> String? {
        guard let url = NSURL(string: self) else { return nil }
        return url.appendingPathComponent(path)!.absoluteString
    }
}
