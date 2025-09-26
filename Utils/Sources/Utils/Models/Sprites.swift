//
//  Sprites.swift
//  Utils
//
//  Created by Denis Fortuna on 26/09/25.
//

import Foundation

public struct Sprites: Codable {
    public let other: OtherData
    public let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case other = "other"
        case frontDefault = "front_default"
    }
    
    public init(other: OtherData, frontDefault: String) {
        self.other = other
        self.frontDefault = frontDefault
    }
}

public struct OtherData: Codable {
    public let dreamWorld: DreamWorld?
    public let home: Home?

    enum CodingKeys: String, CodingKey {
        case home = "home"
        case dreamWorld = "dream_world"
    }
    
    public init(dreamWorld: DreamWorld?, home: Home?) {
        self.dreamWorld = dreamWorld
        self.home = home
    }
}

public struct DreamWorld: Codable {
    public let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
    
    public init(frontDefault: String?) {
        self.frontDefault = frontDefault
    }
}

public struct Home: Codable {
    public let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
    
    public init(frontDefault: String?) {
        self.frontDefault = frontDefault
    }
}

