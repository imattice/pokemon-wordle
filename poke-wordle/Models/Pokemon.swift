//
//  Pokemon.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

import Foundation

struct Pokemon: Identifiable, Codable, Hashable {
    /// The national id for the Pokemon
    let id: Int
    /// The name of the Pokemon
    let name: String
    /// The generation where the pokemon was introduced
    let generation: Int
    /// The two types for the Pokemon
    let type: TypeCollection
    /// The weight of the Pokemon, in grams
    let weight: Measurement<UnitMass>
    /// The height of the Pokemon, in centimeters
    let height: Measurement<UnitLength>
    /// An object containing url paths to image resources
    let imagePath: ImagePath
    /// A string representation of the id containing leading zeros
    var idLabel: String {
        String(format: "%03d", id)
    }
    /// A string representation of the Pokemon's weight formatted to the user's measurement preference
    var weightLabel: String {
        switch UserPreference.weightUnitPreference {
        case .metric:
            return measurementFormatter.string(from: weight.converted(to: .kilograms))

        case .unitedStates:
            let formatter: MeasurementFormatter = measurementFormatter
            formatter.unitStyle = .medium
            return formatter.string(from: weight.converted(to: .pounds))
        }
    }
    /// A string representation of the Pokemon's height formatted to the user's measurement preference
    var heightLabel: String {
        switch UserPreference.heightUnitPreference {
        case .metric:
            return measurementFormatter.string(from: height.converted(to: .meters))

        case .unitedStates:
            return usLengthFormatter.string(fromMeters: height.converted(to: .meters).value)
        }
    }

    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.generation = try container.decode(Int.self, forKey: .generation)
        self.type = try container.decode(TypeCollection.self, forKey: .type)
        let decodedWeight: Double = try container.decode(Double.self, forKey: .weight)
        self.weight = Measurement(value: decodedWeight, unit: UnitMass.grams)
        let decodedHeight: Double = try container.decode(Double.self, forKey: .height)
        self.height = Measurement(value: decodedHeight, unit: UnitLength.centimeters)
        self.imagePath = try container.decode(ImagePath.self, forKey: .imagePath)
    }
}

// MARK: - Type Collection
extension Pokemon {
    struct TypeCollection: Codable, Hashable {
        let primary: PokemonType
        let secondary: PokemonType?
    }
}

// MARK: - Sprite Path
extension Pokemon {
    struct ImagePath: Codable, Hashable {
        let artwork: URL
        let sprite: URL
    }
}

// MARK: - Measurement Formatters
extension Pokemon {
    private var measurementFormatter: MeasurementFormatter {
        let formatter: MeasurementFormatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.numberFormatter.maximumFractionDigits = 1
        formatter.unitStyle = .short

        return formatter
    }
    private var usLengthFormatter: LengthFormatter {
        let formatter: LengthFormatter = LengthFormatter()
        formatter.isForPersonHeightUse = true
        formatter.numberFormatter.maximumFractionDigits = 0
        formatter.unitStyle = .short

        return formatter
    }
}
