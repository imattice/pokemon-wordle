//
//  MailView.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/4/22.
//

import SwiftUI
import MessageUI

/* swiftlint:disable explicit_type_interface */
/// A view used to send email
/// This is a UIViewControllerRepresentable of MFMailComposeViewController
public struct MailView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    let emailComponents: EmailComponents

    public class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }

        public func mailComposeController(
            _ controller: MFMailComposeViewController,
            didFinishWith result: MFMailComposeResult,
            error: Error?) {
                defer {
                    $presentation.wrappedValue.dismiss()
                }
                if let error: Error = error {
                    self.result = .failure(error)
                    return
                }
                self.result = .success(result)
            }
    }
    public func makeCoordinator() -> Coordinator {
        Coordinator(presentation: presentation,
                    result: $result)
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let viewController: MFMailComposeViewController = MFMailComposeViewController()
        viewController.setToRecipients(emailComponents.recipients)
        viewController.setCcRecipients(emailComponents.ccRecipients)
        viewController.setBccRecipients(emailComponents.bccRecipients)
        viewController.setSubject(emailComponents.messageSubject ?? "")
        viewController.setMessageBody(emailComponents.messageBody ?? "",
                                      isHTML: emailComponents.messageBodyIsHTMLFormat)

        if let sendingAddress: String = emailComponents.sendingAddress {
            viewController.setPreferredSendingEmailAddress(sendingAddress)
        }

        viewController.mailComposeDelegate = context.coordinator
        return viewController
    }

    public func updateUIViewController(
        _ uiViewController: MFMailComposeViewController,
        context: UIViewControllerRepresentableContext<MailView>) {
        }
    public init(withComponents components: EmailComponents = EmailComponents(),
                result: Binding<Result<MFMailComposeResult, Error>?>) {
        self.emailComponents = components
        self._result = result
    }
}
/* swiftlint:enable explicit_type_interface */

struct MailView_Previews: PreviewProvider {
    @State static var result: Result<MFMailComposeResult, Error>?

    static var previews: some View {
        MailView(result: $result)
    }
}
