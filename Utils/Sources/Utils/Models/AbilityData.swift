//
//  AbilityData.swift
//  Utils
//
//  Created by Denis Fortuna on 26/09/25.
//

import Foundation

public struct AbilityData: Codable {
    public let ability: Ability
    
    public init(ability: Ability) {
        self.ability = ability
    }
}

public struct Ability: Codable {
    public let name: String
    public let url: String
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
