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
        Text("hi")
        //        Section(content: {
        //            NavigationLink(destination: List(selection: $heightPreference,
        //                                             content: { ForEach(MeasurementSystem.allCases, content: <#T##(_.Element) -> _#>)})) {
        //
        //            } DetailCell(l10n.AppSettings.MeasurementPreference.Cell.Title.height,
        //                       detail: <#T##String#>)
        //            DetailCell(l10n.AppSettings.MeasurementPreference.Cell.Title.weight,
        //                       detail: <#T##String#>)
        //        },
        //                header: {
        //            Text(l10n.AppSettings.MeasurementPreference.header)
        //        })
    }

    private func saveSelections() {

    }
}

//extension MeasurementPreferenceSection {
//    struct SelectableList
//}

struct MeasurementPreferenceSection_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementPreferenceSection()
    }
}
