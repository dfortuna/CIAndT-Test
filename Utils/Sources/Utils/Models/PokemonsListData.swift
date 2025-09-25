//
//  PokemonsListData.swift
//  Networking
//
//  Created by Denis Fortuna on 25/09/25.
//

import Foundation

public struct PokemonsListData: Codable {
    public let count: Int
    public let next: String
    public let previous: String?
    public let results: [Pokemon]
}
