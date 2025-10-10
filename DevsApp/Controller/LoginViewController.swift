//
//  LoginViewController.swift
//  DevsApp
//
//  Created by Jean Ramalho on 09/10/25.
//
import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    private let contentView: LoginView = LoginView()
    
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
