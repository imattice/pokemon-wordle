//
//  UserDefaultsKey.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

enum UserDefaultsKey {
    case starterPokemon
    case weightUnitPreference
    case heightUnitPreference

    var key: String {
        switch self {
        case .starterPokemon:
            return "starterPokemon"
        case .weightUnitPreference:
            return "weightUnitPreference"
        case .heightUnitPreference:
            return "heightUnitPreference"
        }
    }
}
