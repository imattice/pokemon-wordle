//
//  SelectableList.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/3/22.
//

import SwiftUI

struct SelectableList<Option: Identifiable, Content: View>: View {
    var options: [Option]
    @Binding var selection: Option
    var rowView: (Option) -> Content

    var body: some View {
        List(options) { item in
            Row {
                rowView(item)
            }
            .rowStyle(SelectableRowStyle(isChecked: item.id == selection.id))
            .contentShape(Rectangle())
            .onTapGesture {
                updateSelected(with: item)
            }
        }
    }

    /// Creates a `SelectableList`with a selection
    /// - Parameters:
    ///   - options: The options presented in the list
    ///   - selection: The selection the user has made
    ///   - rowView: The view for each row
    init(options: [Option], selection: Binding<Option>, rowView: @escaping (Option) -> Content) {
        self.options = options
        self._selection = selection
        self.rowView = rowView
    }

    func updateSelected(with item: Option) {
        selection = item
    }
}

struct SelectableList_Previews: PreviewProvider {
    private static let items: [PreviewItem] = [
        PreviewItem(title: "apples"),
        PreviewItem(title: "pears"),
        PreviewItem(title: "bananas"),
        PreviewItem(title: "pineapples")
    ]
    @State static var selectedItem: PreviewItem = items[2]

    struct PreviewItem: Identifiable {
        var id: UUID = UUID()
        let title: String
    }

    static var previews: some View {
        VStack {
            Text(selectedItem.title)
            SelectableList(
                options: items,
                selection: $selectedItem) { item in
                    Text(item.title)
            }
        }
    }
}
