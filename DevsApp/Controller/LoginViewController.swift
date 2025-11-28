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
    private let loginViewModel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        checkAuthentication()
        setupContentView()
        setHierarchy()
        setConstraints()
    }
    
    private func checkAuthentication(){
        
        let mainTabViewController: MainTabBarController = MainTabBarController()
        
        self.loginViewModel.checkAuthentication(currentViewController: self, destinyViewController: mainTabViewController)
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
        
        contentView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    
    @objc private func signUpRedirect(){
        
        let signUpViewController = SignUpViewController()
        
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @objc private func login(){
        
        guard let credentials: Credentials = contentView.getUserCredentials() else {return}
        
        self.loginViewModel.login(user: credentials.userName, password: credentials.password)
    }
    
}
