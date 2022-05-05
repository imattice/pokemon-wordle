//
//  LocalizedStrings.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/3/22.
//

import Foundation

/* swiftlint:disable explicit_type_interface type_name nesting */
typealias l10n = LocalizedStrings
/* swiftlint:enable type_name */

enum LocalizedStrings {
    static let appName = NSLocalizedString("appName",
                                           comment: "The name of the application")

    enum AppSettings {
        enum Gameplay {
            static let header = NSLocalizedString(
                "AppSettings.Gameplay.header",
                comment: "Describes a header for a list of options that change gameplay settings")

            enum Cell {
                enum Title {
                    static let starter = NSLocalizedString(
                        "AppSettings.Gameplay.Cell.Title.starter",
                        comment: "Describes a cell allowing the user to update the pokemon used as their first guess option")
                    static let history = NSLocalizedString(
                        "AppSettings.Gameplay.Cell.Title.history",
                        comment: "Describes a cell allowing the user to view all available games")
                }
            }
        }
        enum Notifications {
            static let header = NSLocalizedString(
                "AppSettings.Notifications.header",
                comment: "Describes a header for a list of options that change notification settings")
            static let footer = NSLocalizedString(
                "AppSettings.Notifications.footer",
                comment: "Describes a footer for a list of options that change notification settings")

            enum Cell {
                enum Title {
                    static let enable = NSLocalizedString(
                        "AppSettings.Notifications.Cell.Title.enable",
                        comment: "Describes a cell allowing the user to toggle receiving reminder notifications")
                    static let time = NSLocalizedString(
                        "AppSettings.Notifications.Cell.Title.time",
                        comment: "Describes a cell allowing the user set a time to receive a reminder notification")
                }
            }
        }
        enum MeasurementPreference {
            static let header = NSLocalizedString(
                "AppSettings.MeasurementPreference.header",
                comment: "Describes a header for a list of options that change measurement preference settings")

            enum Cell {
                enum Title {
                    static let height = NSLocalizedString(
                        "AppSettings.MeasurementPreference.Cell.Title.height",
                        comment: "Describes a cell allowing the user to update the unit of measurement for height values")
                    static let weight = NSLocalizedString(
                        "AppSettings.MeasurementPreference.Cell.Title.weight",
                        comment: "Describes a cell allowing the user to update the unit of measurement for weight values")
                }
            }
        }
        enum Feedback {
            enum Cell {
                enum Title {
                    static let feedback = NSLocalizedString(
                        "AppSettings.Feedback.Cell.Title.feedback",
                        comment: "Describes a header for a list of options that change notification settings")
                }
            }
        }
    }
    enum MeasurementPreference {
        static let metric = NSLocalizedString(
            "MeasurementPreference.metric",
            comment: "Describes the metric measurement system")
        static let unitedStates = NSLocalizedString(
            "MeasurementPreference.unitedStates",
            comment: "Describes the measurement system used by the united states")
    }
}
/* swiftlint:enable explicit_type_interface nesting */
