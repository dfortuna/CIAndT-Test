//
//  Pokemon.swift
//  Networking
//
//  Created by Denis Fortuna on 25/09/25.
//

import Foundation

public struct Pokemon: Codable {
    public let name: String
    public let url: String
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
