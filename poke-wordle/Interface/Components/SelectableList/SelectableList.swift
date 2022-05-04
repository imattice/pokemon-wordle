//
//  SelectableList.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/3/22.
//

import SwiftUI

struct SelectableList<Item: Identifiable, Content: View>: View {
    var items: [Item]
    @Binding var selectedItem: Item?
    var rowContent: (Item) -> Content

    var body: some View {
        List(items) { item in
            Row {
                rowContent(item)
            }
            .rowStyle(SelectableRowStyle(isChecked: item.id == selectedItem?.id))
            .contentShape(Rectangle())
            .onTapGesture {
                print(item)
                self.selectedItem = item
            }
        }
    }

    func updateSelected(with item: Item) {
        if item.id == self.selectedItem?.id {
            selectedItem = nil
            return
        }
        selectedItem = item
    }
}

struct SelectableList_Previews: PreviewProvider {
    private static let items: [PreviewItem] = [
        PreviewItem(title: "apples"),
        PreviewItem(title: "pears"),
        PreviewItem(title: "bananas"),
        PreviewItem(title: "pineapples")
    ]
    @State private static var selectedItem: PreviewItem? = items[2]

    private struct PreviewItem: Identifiable {
        var id: UUID = UUID()
        let title: String
    }

    static var previews: some View {
        VStack {
            Text(selectedItem?.title ?? "n")
            SelectableList(
                items: items,
                selectedItem: $selectedItem) { item in
                    Text(item.title)
            }
        }
    }
}
