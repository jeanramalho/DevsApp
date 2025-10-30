//
//  ChatViewModel.swift
//  DevsApp
//
//  Created by Jean Ramalho on 29/10/25.
//
import Foundation

final class ChatViewModel {
    
    // MARK: - Dados públicos (apenas leitura)
    private(set) var messages: [ChatMessage] = []
    
    // Usuário atual (remova/adeque conforme sua camada de autenticação)
    let currentUser: ChatSender = ChatSender(senderId: "user_1", displayName: "Jean")
    let otherUser: ChatSender   = ChatSender(senderId: "user_2", displayName: "Carlos")
    
    // Callback para avisar a view quando há mudanças (simples binding)
    var onMessagesUpdated: (() -> Void)?
    
    init() {
        loadMockMessages()
    }
    
    // Carrega mensagens mockadas (vários tamanhos para testar balões adaptativos)
    private func loadMockMessages() {
        let mocks: [ChatMessage] = [
            ChatMessage(text: "E aí! Testando o chat com MessageKit 🙂", sender: otherUser, date: Date().addingTimeInterval(-3600*24)),
            ChatMessage(text: "Show! Quero ver como ficam os balões com textos longos. Vou mandar uma mensagem bem longa para testar a quebra de linha, tamanho dinâmico, e também para verificar espaçamentos e alinhamento. ✅", sender: currentUser, date: Date().addingTimeInterval(-3600*23)),
            ChatMessage(text: "Perfeito. Parece que funciona muito bem. Outra mensagem curta.", sender: otherUser, date: Date().addingTimeInterval(-3600*22)),
            ChatMessage(text: "Aqui mais uma para garantir que o scroll funciona quando várias mensagens existirem.", sender: currentUser, date: Date().addingTimeInterval(-3600*21)),
            ChatMessage(text: "Última do dia — curto e direto.", sender: otherUser, date: Date().addingTimeInterval(-3600*20))
        ]
        
        self.messages = mocks
        onMessagesUpdated?()
    }
    
    // Número de mensagens (útil para collection view)
    func numberOfMessages() -> Int {
        return messages.count
    }
    
    // Mensagem por indexPath/section (MessageKit usa sections por mensagem)
    func message(at index: Int) -> ChatMessage {
        return messages[index]
    }
    
    // Envia (adiciona) uma nova mensagem de texto — atualiza a lista e chama callback
    func sendMessage(text: String) {
        let new = ChatMessage(text: text, sender: currentUser, date: Date())
        messages.append(new)
        onMessagesUpdated?()
    }
    
    // Simula recebimento de mensagem (útil para testes)
    func receiveMockReply() {
        let reply = ChatMessage(text: "Resposta automática de teste.", sender: otherUser, date: Date())
        messages.append(reply)
        onMessagesUpdated?()
    }
}
