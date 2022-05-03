//
//  UserPreference.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

import Foundation

enum UserPreference {
     private static let defaultWeightUnit: MeasurementSystem = .metric
     private static let defaultHeightUnit: MeasurementSystem = .metric

    static var starterPokemon: Pokemon? {
        get {
            let storedId: Int = UserDefaults.standard.integer(forKey: UserDefaultsKey.starterPokemon.key)
            let dataSource: [Pokemon] = DataSource.shared.pokemon
            if let matchedPokemon: Pokemon = dataSource.first(where: { $0.id == storedId }) {
                return matchedPokemon
            } else if let defaultStarter: Pokemon = dataSource.first {
                return defaultStarter
            } else {
                return nil
            }
        }
        set {
            if let newValue: Pokemon = newValue {
                UserDefaults.standard.set(newValue.id, forKey: UserDefaultsKey.starterPokemon.key)
            } else {
                UserDefaults.standard.removeObject(forKey: UserDefaultsKey.starterPokemon.key)
            }
        }
    }

    static var weightUnitPreference: MeasurementSystem {
        get {
            let storedValue: Int = UserDefaults.standard.integer(forKey: UserDefaultsKey.weightUnitPreference.key)
            return MeasurementSystem(rawValue: storedValue) ?? defaultWeightUnit
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: UserDefaultsKey.weightUnitPreference.key)
        }
    }

    static var heightUnitPreference: MeasurementSystem {
        get {
            let storedValue: Int = UserDefaults.standard.integer(forKey: UserDefaultsKey.heightUnitPreference.key)
            return MeasurementSystem(rawValue: storedValue) ?? defaultHeightUnit
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: UserDefaultsKey.heightUnitPreference.key)
        }
    }

    static var notificationTime: Date? {
        get {
            if let date: Date = UserDefaults.standard.object(forKey: UserDefaultsKey.notificationTime.key) as? Date {
                return date
            }
            return nil
            }
        set {
            if let date: Date = newValue {
                UserDefaults.standard.set(date, forKey: UserDefaultsKey.notificationTime.key)
            } else {
                UserDefaults.standard.removeObject(forKey: UserDefaultsKey.notificationTime.key)
            }
        }
    }
}
