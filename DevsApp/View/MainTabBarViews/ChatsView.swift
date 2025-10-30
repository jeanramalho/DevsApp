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
    
    private let headerView: HeaderView = {
        let headerView = HeaderView(title: "Chats")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Busque uma conversa..."
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
        
        configureTableHeader()
        setHierarchy()
        setConstraints()
    }
    
    private func configureTableHeader() {
        
        // Configura dimensões do headerView
        headerView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: headerHeightChat)
        
        // Força layout Interno do header
        headerView.layoutIfNeeded()
        
        // Define tableHeaderView
        chatsTableView.tableHeaderView = headerView
    }
    
    private func setHierarchy(){
        
        addSubview(chatsTableView)
        
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            // ChatsTableView Contraints
            chatsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            chatsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            chatsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            chatsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
