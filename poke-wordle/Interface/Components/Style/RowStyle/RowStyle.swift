//
//  RowStyle.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/4/22.
//

import SwiftUI

/* swiftlint:disable file_types_order*/
// MARK: - Row Style
protocol RowStyle {
    associatedtype Body: View
    typealias Configuration = RowConfiguration

    func makeBody(configuration: Self.Configuration) -> Self.Body
}

// MARK: - Row Style View
extension View {
    func rowStyle<S: RowStyle>(_ style: S) -> some View {
        environment(\.rowStyle, AnyRowStyle(style: style))
    }
}

// MARK: - Row Style Environment Key
struct RowStyleKey: EnvironmentKey {
    static var defaultValue: AnyRowStyle = AnyRowStyle(style: DefaultRowStyle())
}

// MARK: - Row Style Environment Value
extension EnvironmentValues {
    var rowStyle: AnyRowStyle {
        get { self[RowStyleKey.self] }
        set { self[RowStyleKey.self] = newValue }
    }
}
/* swiftlint:enable file_types_order*/

