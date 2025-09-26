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
    
    public init(abilities: [AbilityData], height: Int, sprites: Sprites, types: [TypeData], weight: Int) {
        self.abilities = abilities
        self.height = height
        self.sprites = sprites
        self.types = types
        self.weight = weight
    }
}
