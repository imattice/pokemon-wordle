//
//  FeedbackSection.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/4/22.
//

import SwiftUI
import MessageUI

struct FeedbackSection: View {
    @State var result: Result<MFMailComposeResult, Error>?
    @State var isShowingMailView: Bool = false

    let emailAddressee: String = "ikemattice@icloud.com"
    let emailSubject: String = "Feedback for \(l10n.appName)"

    var emailComponents: EmailComponents {
        EmailComponents(recipients: [emailAddressee],
                        messageSubject: emailSubject)
    }
    var emailUrl: URL? {
        EmailHelper.createEmailUrl(to: emailAddressee, subject: emailSubject)
    }
    var canSendEmail: Bool {
        MFMailComposeViewController.canSendMail() || emailUrl != nil
    }

    var body: some View {
        if canSendEmail {
            Button(action: presentMailView) { Text(l10n.AppSettings.Feedback.Cell.Title.feedback)
            }
            .sheet(isPresented: $isShowingMailView) {
                MailView(withComponents: emailComponents,
                         result: $result)
            }
        }
    }

    func presentMailView() {
        if MFMailComposeViewController.canSendMail() {
            isShowingMailView = true
        } else if let emailUrl: URL = emailUrl {
            UIApplication.shared.open(emailUrl)
        } else {
            fatalError("Attempted to send an email, but no email application could open url \(String(describing: emailUrl))")
        }
    }
}

struct FeedbackSection_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackSection()
    }
}
