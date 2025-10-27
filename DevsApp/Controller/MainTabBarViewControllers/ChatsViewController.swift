//
//  ChatsViewController.swift
//  DevsApp
//
//  Created by Jean Ramalho on 19/10/25.
//
import Foundation
import UIKit

class ChatsViewController: UIViewController {
    
    private let contentView: ChatsView = ChatsView()
    
    private let navtitle: String = "Chats"
    
    private var fadeStart: CGFloat = 0
    private var fadeEnd: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        setupNavTitleLabel()
        setupNavigationBarAppearance()
        setHierarchy()
        setConstraints()
        setupContentView()
        
        updateNavTitleAlpha(for: contentView.chatsTableView.contentOffset,
                            tableView: self.contentView.chatsTableView,
                            fadeStart: fadeStart,
                            fadeEnd: fadeEnd,
                            titleLabel: self.contentView.navChatTitleLabel)

    }
    
    private func setupNavTitleLabel(){
        
        self.contentView.navChatTitleLabel.text = navtitle
        
        self.navigationItem.titleView = self.contentView.navChatTitleLabel
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    private func updateNavTitleIfNeeded(for offSetY: CGFloat){
        
        let tableView = self.contentView.chatsTableView
        updateNavTitleAlpha(for: tableView.contentOffset,
                            tableView: tableView,
                            fadeStart: fadeStart,
                            fadeEnd: fadeEnd,
                            titleLabel: self.contentView.navChatTitleLabel)
    
    }
    
    
    private func setupContentView(){
        
        let tableView = contentView.chatsTableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
        
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .systemGray2
    }
    
    private func setHierarchy(){
        
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.setConstraintsToParent(self.view)
        
        
    }
}

extension ChatsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // contentOffSet.y indica quando a tabela subiu
        let offSetY = scrollView.contentOffset.y
        updateNavTitleIfNeeded(for: offSetY)
    }
}

extension ChatsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else {return UITableViewCell()}
        
        return cell
    }
    
    
}
