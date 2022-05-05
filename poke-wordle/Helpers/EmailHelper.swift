//
//  EmailHelper.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/4/22.
//

import UIKit
import Foundation

enum EmailHelper {
    static func createEmailUrl(to email: String, subject: String) -> URL? {
        for app in SupportedApplications.allCases {
            guard let url: URL = app.url(to: email, subject: subject) else {
                continue
            }
            if UIApplication.shared.canOpenURL(url) {
                return url
            }
        }

        return nil
    }
}

extension EmailHelper {
    enum SupportedApplications: CaseIterable {
        case gmail
        case outlook
        case yahoo
        case spark
        case apple
    }
}

extension EmailHelper.SupportedApplications {
    func url(to email: String, subject: String) -> URL? {
        guard let stringUrl: String = urlPattern(to: email, subject: subject) else {
            return nil
        }

        return URL(string: stringUrl)
    }

    private func urlPattern(to email: String, subject: String) -> String? {
        let string: String
        switch self {
        case .gmail:
            string = "googlegmail://co?to=\(email)&subject=\(subject)"

        case .outlook:
            string = "ms-outlook://compose?to=\(email)&subject=\(subject)"

        case .yahoo:
            string = "ymail://mail/compose?to=\(email)&subject=\(subject)"

        case .spark:
            string = "readdle-spark://compose?recipient=\(email)&subject=\(subject)"

        case .apple:
            string = "mailto:\(email)?subject=\(subject)"
        }

        return string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}
