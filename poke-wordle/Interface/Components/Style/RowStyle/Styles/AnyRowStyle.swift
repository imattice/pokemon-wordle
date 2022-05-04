//
//  AnyRowStyle.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/4/22.
//

import SwiftUI

struct AnyRowStyle: RowStyle {
    private var _makeBody: (Configuration) -> AnyView

    init<S: RowStyle>(style: S) {
        _makeBody = { configuration in
            AnyView(style.makeBody(configuration: configuration))
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}
