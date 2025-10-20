//
//  SignUpViewController.swift
//  DevsApp
//
//  Created by Jean Ramalho on 17/10/25.
//
import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    private let contentView: SignUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        title = "Cadastre-se"
        
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
