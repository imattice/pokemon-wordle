//
//  PokemonType.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

import SwiftUI

enum PokemonType: String, Codable {
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case steel
    case water
}

extension PokemonType {
    var color: Color {
        switch self {
        case .bug:
            return Color.PokemonType.bug

        case .dark:
            return Color.PokemonType.dark

        case .dragon:
            return Color.PokemonType.dragon

        case .electric:
            return Color.PokemonType.electric

        case .fairy:
            return Color.PokemonType.fairy

        case .fighting:
            return Color.PokemonType.fighting

        case .fire:
            return Color.PokemonType.fire

        case .flying:
            return Color.PokemonType.flying

        case .ghost:
            return Color.PokemonType.ghost

        case .grass:
            return Color.PokemonType.grass

        case .ground:
            return Color.PokemonType.ground

        case .ice:
            return Color.PokemonType.ice

        case .normal:
            return Color.PokemonType.normal

        case .poison:
            return Color.PokemonType.poison

        case .steel:
            return Color.PokemonType.steel

        case .water:
            return Color.PokemonType.water
        }
    }
}
