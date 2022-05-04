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
            .frame(maxWidth: .infinity)
            .font(Font.body.bold())
            .background(Color.App.neutral)
            .foregroundColor(Color.App.tint)
            .cornerRadius(Constant.cornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: Constant.cornerRadius)
                    .stroke(Color.App.tint, lineWidth: Constant.borderWidth)
            }
    }
}

struct CTAButton_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: { /* no action */ },
               label: { Text("New Game") })
        .buttonStyle(CTAStyle())
    }
}
