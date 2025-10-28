//
//  ChatTalkViewController.swift
//  DevsApp
//
//  Created by Jean Ramalho on 28/10/25.
//
import Foundation
import UIKit

class TalkViewController: UIViewController {
    
    private let contentView: TalkView = TalkView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        configureNavTitleView()
        setupNavigationBarAppearance()
        setHierarchy()
        setConstraints()
    }
    
    private func configureNavTitleView(){
        
    }
    
    private func setHierarchy(){
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.setConstraintsToParent(self.view)
    }
}
