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
        
        setupContentView()
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
    
    private func setupContentView(){
        
        contentView.signUpButton.addTarget(self, action: #selector(signUpRedirect), for: .touchUpInside)
        
        contentView.loginButton.addTarget(self, action: #selector(loginToMainView), for: .touchUpInside)
    }
    
    
    @objc private func signUpRedirect(){
        
        let signUpViewController = SignUpViewController()
        
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @objc private func loginToMainView(){
        
        let mainTabBarController = MainTabBarController()
        
        self.navigationController?.setViewControllers([mainTabBarController], animated: true)
    }
    
}
