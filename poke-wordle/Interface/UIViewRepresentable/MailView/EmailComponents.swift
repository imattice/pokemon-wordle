//
//  EmailComponents.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/4/22.
//

import Foundation

/// An object containing components needed to compose an email
public struct EmailComponents {
    /// The address used to send the email
    public var sendingAddress: String?
    /// A collection of addresses to send the email to
    public var recipients: [String]
    /// A collection of addresses to CC the email to
    public var ccRecipients: [String]
    /// A collection of addresses to BCC the email to
    public var bccRecipients: [String]
    /// A subject for the email
    public var messageSubject: String?
    /// The message body for the email
    public var messageBody: String?
    /// Indicates if the message is in HTML format
    public var messageBodyIsHTMLFormat: Bool

    /// Initializes a new instance of EmailComponents
    /// - Parameters:
    ///   - sendingAddress: The address used to send the email, with a default of nil
    ///   - recipients: A collection of addresses to send the email to, with a default of an empty array
    ///   - ccRecipients: A collection of addresses to CC the email to, with a default of an empty array
    ///   - bccRecipients: A collection of addresses to BCC the email to, with a default of an empty array
    ///   - messageSubject: A subject for the email, with a default of nil
    ///   - messageBody: The message body for the email, with a default of nil
    ///   - messageBodyIsHTMLFormat: Indicates if the message is in HTML format, with a default of false
    public init(sendingAddress: String? = nil,
                recipients: [String] = [String](),
                ccRecipients: [String] = [String](),
                bccRecipients: [String] = [String](),
                messageSubject: String? = nil,
                messageBody: String? = nil,
                messageBodyIsHTMLFormat: Bool = false) {
        self.sendingAddress = sendingAddress
        self.recipients = recipients
        self.ccRecipients = ccRecipients
        self.bccRecipients = bccRecipients
        self.messageSubject = messageSubject
        self.messageBody = messageBody
        self.messageBodyIsHTMLFormat = messageBodyIsHTMLFormat
    }
}
