//
//  PokemonData.swift
//  Utils
//
//  Created by Denis Fortuna on 25/09/25.
//

import Foundation

public struct PokemonData: Codable {
    public let abilities: [Ability]
    public let height: Int
    public let sprites: Sprites
    public let type: [PokemonType]
    public let weight: Int
}

public struct Ability: Codable {

}

public struct Sprites: Codable {

}

public struct PokemonType: Codable {

}
