//
//  CTAButton.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

import SwiftUI

struct CTAStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct CTAButton_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: { /* no action */},
               label: { Text("New Game")})
        .buttonStyle(CTAStyle())
    }
}
