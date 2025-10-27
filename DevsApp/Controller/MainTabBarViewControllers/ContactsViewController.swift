//
//  ContactsViewController.swift
//  DevsApp
//
//  Created by Jean Ramalho on 20/10/25.
//
import Foundation
import UIKit

class ContactsViewController: UIViewController {
    
    private let contentView: ContactsView = ContactsView()
    
    private let navTitle: String = "Contatos"
    
    private var fadeStart: CGFloat = 0
    private var fadeEnd: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        setupNavigationBarAppearance()
        setHierarchy()
        setConstraints()
        setupNavTitleLabel()
        setupContentView()
        
        updateNavTitleAlpha(for: self.contentView.contactsTableView.contentOffset,
                            tableView: self.contentView.contactsTableView,
                            fadeStart: fadeStart,
                            fadeEnd: fadeEnd,
                            titleLabel: self.contentView.navContactsTitleLabel)
    }
    
    private func setupNavTitleLabel(){
        
        self.contentView.navContactsTitleLabel.text = navTitle
        
        self.navigationItem.titleView = self.contentView.navContactsTitleLabel
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func updateNavTitleIfNeeded(for offSetY: CGFloat){
        
        let tableView = self.contentView.contactsTableView
        updateNavTitleAlpha(for: tableView.contentOffset,
                            tableView: tableView,
                            fadeStart: fadeStart,
                            fadeEnd: fadeEnd,
                            titleLabel: self.contentView.navContactsTitleLabel)
    }
    
    private func setupContentView(){
        
        let tableView = contentView.contactsTableView
        tableView.delegate = self
        tableView.dataSource = self
        
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

extension ContactsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // contentOffSet.y indica quando a tabela subiu
        let offSetY = scrollView.contentOffset.y
        self.updateNavTitleIfNeeded(for: offSetY)
    }
}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = "testando nova tableView"
        cell.detailTextLabel?.text = "é uma tableview Muito boa"
        return cell
    }
    
    
    
}
