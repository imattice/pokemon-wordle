//
//  SelectableRow.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/3/22.
//

import SwiftUI

struct Row<Content: View>: View {
    @Environment(\.rowStyle) var style: AnyRowStyle
    var content: () -> Content

    var body: some View {
        style
            .makeBody(
                configuration: RowConfiguration(
                    rowView: RowConfiguration.RowView(
                        content: content())))
    }

    init(content: @escaping () -> Content) {
        self.content = content
    }

    //    init(title: String, image: Image? = nil) where Content == DefaultRow {
    //        self.content = { DefaultRow(title: title, image: image)  as! Content }
    //    }

    @ViewBuilder private func defaultRow<Content: View>(title: String, image: Image? = nil) -> some View {
        HStack {
            if let image: Image = image {
                image
            }
            Text(title)
            Spacer()
        }
    }
}

struct Row_Previews: PreviewProvider {
    static let title: String = "Cell Title"
    static let image: Image = Image(systemName: "person.fill")

    static var previews: some View {
        List {
            Row {
                HStack {
                    image
                    Text(title)
                }
            }
            .rowStyle(SelectableRowStyle(isChecked: true))

            Row {
                HStack {
                    image
                    Text(title)
                }
            }
            .rowStyle(SelectableRowStyle(isChecked: false))
        }
    }
}
