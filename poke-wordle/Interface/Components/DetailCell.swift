//
//  DetailCell.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/3/22.
//

import SwiftUI

struct DetailCell: View {
    let title: String
    let detail: String

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(detail)
                .foregroundColor(Color(uiColor: .systemGray4))
        }
        .padding()
    }

    init(_ title: String, detail: String) {
        self.title = title
        self.detail = detail
    }
}

struct DetailCell_Previews: PreviewProvider {
    static let title: String = "Title"
    static let detail: String = "Detail"

    static var previews: some View {
        DetailCell(title, detail: detail)
    }
}
