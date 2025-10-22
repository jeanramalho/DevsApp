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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.setConstraintsToParent(self.view)
    }
}
