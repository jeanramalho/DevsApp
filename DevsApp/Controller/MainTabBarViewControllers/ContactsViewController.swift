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
