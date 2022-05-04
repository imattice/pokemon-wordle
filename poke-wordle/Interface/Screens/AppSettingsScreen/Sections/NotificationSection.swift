//
//  NotificationSection.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/3/22.
//

import SwiftUI

struct NotificationSection: View {
    @State private var notificationEnabled: Bool = UserPreference.notificationTime != nil
    @State private var notificationTime: Date? = UserPreference.notificationTime

    var body: some View {
        Section(
            content: {
                Toggle(isOn: $notificationEnabled) {
                    Text(l10n.AppSettings.Notifications.Cell.Title.enable)
                }
                if notificationEnabled {
                    DatePicker(selection: Binding<Date>(
                        get: { self.notificationTime ?? Date() },
                        set: { self.notificationTime = $0 }),
                               displayedComponents: .hourAndMinute) {
                        Text(l10n.AppSettings.Notifications.Cell.Title.time)
                    }
                }
            },
            header: { Text(l10n.AppSettings.Notifications.header) },
            footer: { Text(l10n.AppSettings.Notifications.footer) })
        .onDisappear {
            saveSelections()
        }
    }

    private func saveSelections() {
        if notificationEnabled == false {
            notificationTime = nil
        }
    }
}

struct NotificationSection_Previews: PreviewProvider {
    static var previews: some View {
        List {
            NotificationSection()
        }
    }
}
