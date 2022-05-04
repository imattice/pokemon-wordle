//
//  DefaultRowStyle.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/4/22.
//

import SwiftUI

struct DefaultRowStyle: RowStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.rowView
            .background(Color.blue)
    }
}
