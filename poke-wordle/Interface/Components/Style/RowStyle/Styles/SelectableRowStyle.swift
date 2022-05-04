//
//  SelectableRowStyle.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/4/22.
//

import SwiftUI

struct SelectableRowStyle: RowStyle {
    var isChecked: Bool

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.rowView
            Spacer()
            Group {
                if isChecked {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .foregroundColor(Color(uiColor: .tintColor))
                } else {
                    Image(systemName: "circle")
                        .resizable()
                        .foregroundColor(Color(uiColor: .systemGray4))
                }
            }
            .frame(width: 20, height: 20)
        }
    }
}
