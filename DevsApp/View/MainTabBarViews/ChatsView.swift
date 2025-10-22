//
//  ChatsView.swift
//  DevsApp
//
//  Created by Jean Ramalho on 20/10/25.
//
import UIKit
import Foundation

class ChatsView: UIView {
    
    private let headerView: HeaderView = {
        let headerView = HeaderView(title: "Chats")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
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
        setConstraints()
    }
    
    private func setHierarchy(){
        
        addSubview(chatsTableView)
        addSubview(headerView)
        
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            // HeaderView Contraints
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            // ChatsTableView Contraints
            chatsTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            chatsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            chatsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            chatsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
