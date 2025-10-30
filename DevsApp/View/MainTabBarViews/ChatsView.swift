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
        return searchBar
    }()
    
    lazy var chatsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = Colors.bgColor
        return tableView
    }()
    
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
    
    private func configureTableHeader() {
        
        // Cria um header Conteinar com frame explicito
        // UITableView usa o frame da view que for atribuida a tableHeaderView
        let witdh = UIScreen.main.bounds.width
        
        // Configura dimensões do headerStackView
        headerStackView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: headerHeightChat)
        
        // Força layout Interno do header
        headerStackView.layoutIfNeeded()
        
        // Define tableHeaderView
        chatsTableView.tableHeaderView = headerStackView
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
