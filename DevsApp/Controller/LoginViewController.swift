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
    private var cancellables = Set<AnyCancellable>()
    
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
        
        
        contentView.onLoginTap = { [weak self] in
            self?.login()
        }
        
        contentView.onLoginTap = { [weak self] in
            self?.signUpRedirect()
        }
    }
    
    // MARK: - Bindings (VM -> View/Controller)
    private func bindViewModel() {
        
        //Bind password visibility (VM -> View)
        viewModel.isPasswordVisible
            .receive(on: DispatchQueue.main)
            .sink { [weak self] visible in
                self?.contentView.setPasswordVisibility(visible)
            }
            .store(in: &cancellables)
        
        //Observe authentication state (VM -> Controller -> Navigation)
        viewModel.isAuthenticated
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isAuth in
                guard let self = self else {return}
                    if isAuth {
                        let mainTabBarController = MainTabBarController()
                        // replace stack with main tab
                        self.navigationController?.setViewControllers([mainTabBarController], animated: true)
                        
                    } else {
                        // stay on login screen
                        // presents custom Alert
                        
                    }
            }
            .store(in: &cancellables)
            
        // Observe login state for UI feedback
        viewModel.loginState
            .receive(on: DispatchQueue.main)
            .sink {[weak self] state in
                guard let self = self else {return}
                switch state {
                case .idle:
                    break
                case .loading:
                    //Show loading indicator
                    break
                case .success:
                    let mainTabBarController = MainTabBarController()
                    self.navigationController?.setViewControllers([mainTabBarController], animated: true)
                case .failure(let error):
                    self.showError(error.localizedDescription)
                }
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Actions
    
    private func signUpRedirect(){
        
        let signUpViewController = SignUpViewController()
        
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    private func login(){
        
        guard let credentials = contentView.getUserCredentials() else {
            showError("Preencha seu email e senha")
            return
        }
        viewModel.login(user: credentials.userName, password: credentials.password)
    }
    
    // MARK: - Helpers
    private func showError(_ message: String) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
