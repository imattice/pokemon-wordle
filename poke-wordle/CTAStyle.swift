//
//  CTAStyle.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

import SwiftUI

struct CTAStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.App.neutral)
            .foregroundColor(Color.App.tint)
            .clipShape(Capsule())
    }
}

struct CTAButton_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: { /* no action */ },
               label: { Text("New Game") })
        .buttonStyle(CTAStyle())
    }
}
