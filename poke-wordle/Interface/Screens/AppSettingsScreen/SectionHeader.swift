//
//  SectionHeader.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/3/22.
//

import SwiftUI

extension AppSettingsScreen {
    struct SectionHeader: View {
        let title: String
        var body: some View {
            Text(title)
        }
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static let title: String = "Section Header"

    static var previews: some View {
        AppSettingsScreen.SectionHeader(title: title)
    }
}
