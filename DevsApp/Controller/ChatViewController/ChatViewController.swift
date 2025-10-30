//
//  ChatViewController.swift
//  DevsApp
//
//  Created by Jean Ramalho on 29/10/25.
//
import UIKit
import MessageKit
import InputBarAccessoryView

final class ChatViewController: UIViewController {
    
    // MARK: - ViewModel
    private let viewModel = ChatViewModel()
    
    // MARK: - Sua TalkView (mantida como você forneceu)
    private lazy var talkView: TalkView = {
        return TalkView()
    }()
    
    // MARK: - MessageKit controller (filho)
    private let messagesController = MessagesViewController()
    
    // MARK: - Lifecycle
    override func loadView() {
        // usamos sua TalkView como root view (não alteramos a TalkView)
        view = talkView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildMessagesController()
        configureMessageKit()
        setupBindings()
    }
    
    // MARK: - Setup do MessagesViewController como child
    private func setupChildMessagesController() {
        addChild(messagesController)
        // adiciona a view do messagesController dentro do TalkView
        messagesController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(messagesController.view)
        
        // sendSubviewToBack do background image is already done in TalkView,
        // então apenas colocamos a messagesCollectionView acima do background.
        NSLayoutConstraint.activate([
            messagesController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            messagesController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            messagesController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            messagesController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor) // deixa inputBar do MessagesViewController acomodar-se
        ])
        messagesController.didMove(toParent: self)
    }
    
    // MARK: - Configurações do MessageKit (delegates, aparência)
    private func configureMessageKit() {
        // DataSource / Delegates
        messagesController.messagesCollectionView.messagesDataSource = self
        messagesController.messagesCollectionView.messagesLayoutDelegate = self
        messagesController.messagesCollectionView.messagesDisplayDelegate = self
        messagesController.messageInputBar.delegate = self
        
        // Visual: fundo transparente para mostrar seu background
        messagesController.view.backgroundColor = .clear
        messagesController.messagesCollectionView.backgroundColor = .clear
        
        // Ajustes UX
        messagesController.maintainPositionOnKeyboardFrameChanged = true
        messagesController.messagesCollectionView.keyboardDismissMode = .interactive
        messagesController.scrollsToLastItemOnKeyboardBeginsEditing = true
        
        // Registro de células extras (se for usar custom cells no futuro)
        // messagesController.messagesCollectionView.register(CustomCell.self)
    }
    
    // MARK: - Bindings com ViewModel
    private func setupBindings() {
        viewModel.onMessagesUpdated = { [weak self] in
            guard let self = self else { return }
            // reload de maneira elegante:
            self.messagesController.messagesCollectionView.reloadData()
            self.messagesController.messagesCollectionView.layoutIfNeeded()
            // garante scroll ao final
            if self.viewModel.numberOfMessages() > 0 {
                let lastIndex = self.viewModel.numberOfMessages() - 1
                let lastIndexPath = IndexPath(item: 0, section: lastIndex)
                self.messagesController.messagesCollectionView.scrollToItem(at: lastIndexPath, at: .bottom, animated: true)
            }
        }
    }
}

// MARK: - MessageKit DataSource / Layout / Display
extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
  
    // Quantas mensagens (MessageKit usa sections = mensagens)
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return viewModel.numberOfMessages()
    }
    
    // Cada section deve retornar a MessageType correspondente
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return viewModel.message(at: indexPath.section)
    }
    
    // Sender atual (necessário para identificar quem é você)
    var currentSender: any MessageKit.SenderType {
        return viewModel.currentUser
    }
    
    // Top label (ex: nome do usuário no início de um grupo de mensagens)
    func cellTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        // mostrar data apenas quando for a primeira mensagem do dia (exemplo simples)
        let dateText = (message.sentDate as Date).formattedShort()
        return NSAttributedString(string: dateText, attributes: [
            .font: UIFont.systemFont(ofSize: 12, weight: .regular),
            .foregroundColor: UIColor(white: 0.2, alpha: 0.7)
        ])
    }
    
    // Customize a largura do top label
    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 18
    }
    
    // Avatar: podemos esconder ou personalizar
    func avatarSize(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return CGSize(width: 34, height: 34)
    }
    
    // Avatar image builder (usando iniciais)
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        let chatMessage = viewModel.message(at: indexPath.section)
        let senderName = chatMessage.sender.displayName
        let initials = senderName.components(separatedBy: " ").compactMap({ $0.first }).prefix(2).map{ String($0) }.joined()
        let avatar = Avatar(initials: initials)
        avatarView.set(avatar: avatar)
    }
    
    // Display — cor do balão
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        // mensagem do usuário: bolha escura (preto/roxo conforme seu tema)
        if isFromCurrentSender(message: message) {
            // use cores do seu design (mantive preto/roxo / fácil de alterar)
            return UIColor(red: 36/255, green: 17/255, blue: 50/255, alpha: 1) // tom roxo escuro
        } else {
            // mensagens recebidas: cinza suave translúcido
            return UIColor(white: 1.0, alpha: 0.9)
        }
    }
    
    // Estilo do balão (cauda à esquerda/direita)
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        let tail: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
        return .bubbleTail(tail, .curved)
    }
    
    // Texto da mensagem: cor (preto no recebidos, branco no enviado)
    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .white : .black
    }
    
    // Footer para timestamp (opcional)
    func messageBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let date = message.sentDate.formattedHourMinute()
        return NSAttributedString(string: date, attributes: [
            .font: UIFont.systemFont(ofSize: 11),
            .foregroundColor: UIColor(white: 0.5, alpha: 1)
        ])
    }
    
    func messageBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 18
    }
}

// MARK: - InputBarAccessoryView Delegate (enviar mensagens)
extension ChatViewController: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        // limpa campo
        inputBar.inputTextView.text = ""
        // envia via ViewModel
        viewModel.sendMessage(text: trimmed)
        
        // opcional: simular resposta automática após 1s
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.viewModel.receiveMockReply()
        }
    }
}
