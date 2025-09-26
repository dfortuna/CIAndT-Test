//
//  PokemonDetailData.swift
//  Utils
//
//  Created by Denis Fortuna on 25/09/25.
//

import Foundation

public struct PokemonDetailData: Codable {
    public let abilities: [AbilityData]
    public let height: Int
    public let sprites: Sprites
    public let types: [TypeData]
    public let weight: Int
}

public struct AbilityData: Codable {
    public let ability: Ability
}

public struct Ability: Codable {
    public let name: String
    public let url: String
}

// - - - - - - - - -

public struct Sprites: Codable {
    public let other: OtherData
    public let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case other = "other"
        case frontDefault = "front_default"
    }
}

public struct OtherData: Codable {
    public let dreamWorld: DreamWorld?
    public let home: Home?

    enum CodingKeys: String, CodingKey {
        case home = "home"
        case dreamWorld = "dream_world"
    }
}

public struct DreamWorld: Codable {
    public let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

public struct Home: Codable {
    public let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}



// - - - - - - - - -

public struct TypeData: Codable {
    public let slot: Int
    public let type: TypeInfo
}

public struct TypeInfo: Codable {
    public let name: String
    public let url: String
}

