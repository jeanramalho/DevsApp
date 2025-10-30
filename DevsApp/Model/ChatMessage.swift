//
//  ChatMessage.swift
//  DevsApp
//
//  Created by Jean Ramalho on 29/10/25.
//
import Foundation
import MessageKit
import UIKit

// MARK: - Sender (representa quem enviou a mensagem)
struct ChatSender: SenderType, Equatable {
    let senderId: String
    let displayName: String
    var photoURL: String? = nil
}

// MARK: - Message (implementa MessageType do MessageKit)
struct ChatMessage: MessageType, Equatable {
    let sender: SenderType
    let messageId: String
    let sentDate: Date
    let kind: MessageKind
    
    // convenience initializer para texto
    init(text: String, sender: ChatSender, messageId: String = UUID().uuidString, date: Date = Date()) {
        self.sender = sender
        self.messageId = messageId
        self.sentDate = date
        self.kind = .text(text)
    }
    
    // helper para comparar (útil em testes/unit)
    static func == (lhs: ChatMessage, rhs: ChatMessage) -> Bool {
        return lhs.messageId == rhs.messageId
    }
}
