//
//  Color.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

import SwiftUI

extension Color {
    static let shadow: Color = Color("Color/Misc/shadow")

    enum App {
        static let neutral: Color = Color("Color/App/Neutral")
        static let tint: Color = Color("Color/App/Tint")
    }
    enum Text {
        static let main: Color = Color("Color/Text/Main")
    }
    enum PokemonType {
        static let bug: Color = Color("Color/Type/Bug")
        static let dark: Color = Color("Color/Type/Dark")
        static let dragon: Color = Color("Color/Type/Dragon")
        static let electric: Color = Color("Color/Type/Electric")
        static let fairy: Color = Color("Color/Type/Fairy")
        static let fighting: Color = Color("Color/Type/Fighting")
        static let fire: Color = Color("Color/Type/Fire")
        static let flying: Color = Color("Color/Type/Flying")
        static let ghost: Color = Color("Color/Type/Ghost")
        static let grass: Color = Color("Color/Type/Grass")
        static let ground: Color = Color("Color/Type/Ground")
        static let ice: Color = Color("Color/Type/Ice")
        /* swiftlint:disable discouraged_none_name */
        static let none: Color = Color("Color/Type/None")
        /* swiftlint:enable discouraged_none_name */
        static let normal: Color = Color("Color/Type/Normal")
        static let poison: Color = Color("Color/Type/Poison")
        static let steel: Color = Color("Color/Type/Steel")
        static let water: Color = Color("Color/Type/Water")
    }
}
