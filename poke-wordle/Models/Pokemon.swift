//
//  Pokemon.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

import Foundation

struct Pokemon: Identifiable, Codable {
    /// The national id for the Pokemon
    let id: Int
    /// The name of the Pokemon
    let name: String
    /// The two types for the Pokemon
    let type: TypeCollection
    /// The weight of the Pokemon, in kilograms
    let weight: Measurement<UnitMass>
    /// The height of the Pokemon, in meters
    let height: Measurement<UnitLength>
    /// An object containing url paths to image resources
    let sprite: SpritePath
    /// A string representation of the id containing leading zeros
    var idLabel: String {
        String(format: "%03d", id)
    }

    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(TypeCollection.self, forKey: .type)
        let decodedWeight: Double = try container.decode(Double.self, forKey: .weight)
        self.weight = Measurement(value: decodedWeight, unit: UnitMass.kilograms)
        let decodedHeight: Double = try container.decode(Double.self, forKey: .height)
        self.height = Measurement(value: decodedHeight, unit: UnitLength.meters)
        self.sprite = try container.decode(SpritePath.self, forKey: .sprite)
    }
}

// MARK: - Type Collection
extension Pokemon {
    struct TypeCollection: Codable {
        let primary: PokemonType
        let secondary: PokemonType?
    }
}

// MARK: - Sprite Path
extension Pokemon {
    struct SpritePath: Codable {
        let artwork: URL
        let sprite: URL
    }
}
