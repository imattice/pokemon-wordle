//
//  TitledIcon.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/5/22.
//

import SwiftUI

struct TitledIcon: View {
    let name: String

    var body: some View {
        VStack {
            Image(name)

            Text(name.capitalized)
                .font(.caption2)
        }
    }
}

struct TitledIcon_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TitledIcon(name: "rillaboom-gmax")
            TitledIcon(name: "squirtle")
        }
        .previewLayout(.sizeThatFits)
    }
}
