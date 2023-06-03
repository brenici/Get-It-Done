//
//  EncodableExtension.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation

extension Encodable {
    
    func asDictionary() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return dictionary ?? [:]
        } catch {
            return [:]
        }
    }
    
}
