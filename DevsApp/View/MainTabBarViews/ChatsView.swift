//
//  ChatsView.swift
//  DevsApp
//
//  Created by Jean Ramalho on 20/10/25.
//
import UIKit
import Foundation

class ChatsView: UIView {
    
    public let headerHeightChat: CGFloat = 110
    
    lazy var navChatTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        return stackView
    }()
    
    private let headerView: HeaderView = {
        let headerView = HeaderView(title: "Chats")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let ChatsSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Busque uma conversa..."
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = .systemGray
        return searchBar
    }()
    
    lazy var chatsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = Colors.bgColor
        tableView.contentInsetAdjustmentBehavior = .automatic
        return tableView
    }()
    
    // Container usado para calcular o header antes de atribuit tableHeaderView
    private var headerContainer: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        backgroundColor = Colors.bgColor
        
        setHierarchy()
        configureTableHeader()
        setConstraints()
    }
    
    // Chamado automáticamente quando a view muda de tamanho
    override func layoutSubviews() {
        super.layoutSubviews()
        updateTableHeaderIfNeeded()
    }
    
    // MARK: - Configuração do header usando systemLayoutSizeFitting
    private func configureTableHeader() {
        
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = Colors.bgColor
        
        container.addSubview(headerStackView)
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: container.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            headerStackView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        
        // Garante a altura do searchBar pelo calculo
        ChatsSearchBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        
        // Salva referencia para atualizações futuras
        self.headerContainer = container
        
        let targetWidth = UIScreen.main.bounds.width
        
        let widthConstraint = container.widthAnchor.constraint(equalToConstant: targetWidth)
        
        // Força layout e calcula tamanho comprimido
        container.setNeedsLayout()
        container.layoutIfNeeded()
        let fittingSize = container.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
        // Desativa constraint temporária
        widthConstraint.isActive = false
        
        // Atribui frame correto antes de setar tabletHeaderView
        container.frame = CGRect(x: 0, y: 0, width: targetWidth, height: fittingSize.height)
        
        // seta tableHeaderView
        chatsTableView.tableHeaderView = container
    }
    
    private func updateTableHeaderIfNeeded(){
        
        guard let container = headerContainer else {return}
        
        let targetWidth = self.bounds.width
        
        // Calcula novo tamanho com nova largura
        let widthConstraint = container.widthAnchor.constraint(equalToConstant: targetWidth)
        widthConstraint.isActive = true
        
        container.setNeedsLayout()
        container.layoutIfNeeded()
        
        let fittingSize = container.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        widthConstraint.isActive = false
        
        // Só atualiza se houver mudança de altura (evita resets desnecessários)
        if chatsTableView.tableHeaderView?.frame.height != fittingSize.height {
            container.frame = CGRect(x: 0, y: 0, width: targetWidth, height: fittingSize.height)
            chatsTableView.tableHeaderView = container
        }
    }
    
    private func setHierarchy(){
        
        addSubview(chatsTableView)
        
        headerStackView.addArrangedSubview(headerView)
        headerStackView.addArrangedSubview(ChatsSearchBar)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            
            // ChatsTableView Constraints
            chatsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            chatsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            chatsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            chatsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
