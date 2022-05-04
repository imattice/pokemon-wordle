//
//  WeightMeasurementSystem.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

enum MeasurementSystem: Int, CaseIterable {
    case metric = 0
    case unitedStates = 1
}

extension MeasurementSystem {
    var label: String {
        switch self {
        case .metric:
            return l10n.MeasurementPreference.metric

        case .unitedStates:
            return l10n.MeasurementPreference.unitedStates
        }
    }
}

// MARK: - Identifiable
extension MeasurementSystem: Identifiable {
    var id: Self { self }
}
