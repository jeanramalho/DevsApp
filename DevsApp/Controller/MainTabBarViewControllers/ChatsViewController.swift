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
