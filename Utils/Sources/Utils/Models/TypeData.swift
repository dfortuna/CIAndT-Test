//
//  TypeData.swift
//  Utils
//
//  Created by Denis Fortuna on 26/09/25.
//

import Foundation

public struct TypeData: Codable {
    public let slot: Int
    public let type: TypeInfo
    
    public init(slot: Int, type: TypeInfo) {
        self.slot = slot
        self.type = type
    }
}

public struct TypeInfo: Codable {
    public let name: String
    public let url: String
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
