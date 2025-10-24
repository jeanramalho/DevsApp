//
//  ContactsView.swift
//  DevsApp
//
//  Created by Jean Ramalho on 20/10/25.
//
import Foundation
import UIKit

class ContactsView: UIView {
    
    public let headerHeightContacts: CGFloat = 110
    
    lazy var navContactsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let headerView: HeaderView = {
        let headerView = HeaderView(title: "Contatos")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    lazy var contactsTableView: UITableView = {
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
        
        setupTableHeader()
        setHierarchy()
        setConstraints()
    }
    
    private func setupTableHeader(){
        
        // Define ajustes da headerView
        headerView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: headerHeightContacts)
        headerView.layoutIfNeeded()
        
        // Define tableHeaderView
        contactsTableView.tableHeaderView = headerView
    }
    
    private func setHierarchy(){
        
        addSubview(contactsTableView)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            // Define constraints da tableView
            contactsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contactsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contactsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contactsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
