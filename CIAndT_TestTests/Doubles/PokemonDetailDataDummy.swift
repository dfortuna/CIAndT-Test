//
//  PokemonDetailDataDummy.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 26/09/25.
//

import Foundation
import Utils

extension PokemonDetailData {
    static func dummy() -> PokemonDetailData {
        return PokemonDetailData(abilities: [AbilityData.dummy()], height: 100, sprites: Sprites.dummy(), types: [TypeData.dummy()], weight: 30)
    }
}

extension TypeData {
    static func dummy() -> TypeData {
        return TypeData(slot: 111, type: TypeInfo.dummy())
    }
}

extension TypeInfo {
    static func dummy() -> TypeInfo {
        return TypeInfo(name: "GGG", url: "FFF")
    }
}

extension AbilityData {
    static func dummy() -> AbilityData {
        return AbilityData(ability: Ability.dummy())
    }
}

extension Ability {
    static func dummy() -> Ability {
        return Ability(name: "DDD", url: "EEE")
    }
}

extension Sprites {
    static func dummy() -> Sprites {
        return Sprites(other: OtherData.dummy(), frontDefault: "CCC")
    }
}

extension OtherData {
    static func dummy() -> OtherData {
        return OtherData(dreamWorld: DreamWorld.dummy(), home: Home.dummy())
    }
}

extension DreamWorld {
    static func dummy() -> DreamWorld {
        return DreamWorld(frontDefault: "BBB")
    }
}

extension Home {
    static func dummy() -> Home {
        return Home(frontDefault: "AAA")
    }
}
