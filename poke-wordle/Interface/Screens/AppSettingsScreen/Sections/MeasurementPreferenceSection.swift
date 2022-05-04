//
//  MeasurementPreferenceSection.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/3/22.
//

import SwiftUI

struct MeasurementPreferenceSection: View {
    @State private var weightPreference: MeasurementSystem = UserPreference.weightUnitPreference
    @State private var heightPreference: MeasurementSystem = UserPreference.heightUnitPreference

    var body: some View {
        Section(content: {
            NavigationLink(
                destination: MeasurementSystemSelectableList(
                    selection: $heightPreference)) {
                        DetailCell(l10n.AppSettings.MeasurementPreference.Cell.Title.height,
                                   detail: heightPreference.label)
            }
            NavigationLink(
                destination: MeasurementSystemSelectableList(
                    selection: $weightPreference)) {
                        DetailCell(l10n.AppSettings.MeasurementPreference.Cell.Title.weight,
                                   detail: weightPreference.label)
            }
        },
                header: {
            Text(l10n.AppSettings.MeasurementPreference.header)
        })
    }
}

struct MeasurementPreferenceSection_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementPreferenceSection()
    }
}
