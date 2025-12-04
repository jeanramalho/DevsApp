//
//  LoginViewController.swift
//  DevsApp
//
//  Created by Jean Ramalho on 09/10/25.
//
import Foundation
import UIKit
import Combine

class LoginViewController: UIViewController {
    
    // MARK: - UI & ViewModel
    private let contentView: LoginView = LoginView()
    private let viewModel: LoginViewModelType
    private let cancellables = Set<AnyCancellable>()
    
    // MARK: - Init (DI Friendly)
    init(viewModel: LoginViewModelType = LoginViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = LoginViewModel()
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindViewModel()
        viewModel.checkAuthentication()
    }
    
    private func setup(){
        
        view.backgroundColor = Colors.bgColor
        
        setHierarchy()
        setConstraints()
        setupContentActions()
    }
    
    private func setHierarchy(){
        
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.setConstraintsToParent(self.view)
    }
    
    private func setupContentActions() {
        // user events -> ViewModel
        contentView.onShowPasswordToggle = {[weak self] isOn in
            self?.viewModel.setPasswordVisibility(isOn)
        }
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
