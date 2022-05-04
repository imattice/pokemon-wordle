//
//  RowConfiguration.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/4/22.
//

import SwiftUI

struct RowConfiguration {
    /// A type-erased label of a Card.
    struct RowView: View {
        init<Content: View>(content: Content) {
            body = AnyView(content)
        }

        var body: AnyView
    }

    let rowView: RowConfiguration.RowView
}
