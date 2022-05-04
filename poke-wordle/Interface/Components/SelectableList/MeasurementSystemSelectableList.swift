//
//  MeasurementSystemSelectableList.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/4/22.
//

import SwiftUI

struct MeasurementSystemSelectableList: View {
    @Binding var selection: MeasurementSystem
    var body: some View {
        SelectableList(
            options: MeasurementSystem.allCases,
            selection: $selection) { item in
                Row {
                    Text(item.label)
                }
        }
    }
}

struct MeasurementSystemSelectableList_Previews: PreviewProvider {
    @State static var selection: MeasurementSystem = .metric

    static var previews: some View {
        MeasurementSystemSelectableList(selection: $selection)
    }
}
