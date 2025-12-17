//
//  SignUpViewController.swift
//  DevsApp
//
//  Created by Jean Ramalho on 17/10/25.
//
import Foundation
import UIKit
import Combine

final class SignUpViewController: UIViewController {
    
    private let contentView = SignUpView()
    private let viewModel: SignUpViewModelType
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: SignUpViewModelType = SignUpViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = SignUpViewModel()
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        title = "Cadastre-se"
        view.backgroundColor = Colors.bgColor
        
        setHierarchy()
        setConstraints()
        setupActions()
        bindViewModel()
    }
    
    private func setHierarchy(){
        
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.setConstraintsToParent(self.view)
    }
    
    private func setupActions(){
        // Quando o usuário tocar em cadastrar
        contentView.onSignUpTap = { [weak self] in
            self?.handleSignUpTap()
        }
    }
    
    private func bindViewModel(){
        
        viewModel.signUpState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                self?.handleSignUpState(state)
            }
            .store(in: &cancellables)
    }
    
    private func handleSignUpTap(){
        guard let data = contentView.getSignUpData() else {
            showAlert(title: "Erro", message: "Preencha todos os campos.")
            return
        }
        viewModel.signUp(name: data.name, email: data.email, password: data.password, confirmPassword: data.confirmPassword)
    }
    
    private func handleSignUpState(_ state: SignUpState) {
        
        switch state {
        case .idle:
            contentView.setLoading(false)
        case .loading:
            contentView.setLoading(true)
        case .success:
            contentView.setLoading(false)
            let alert = CustomAlert(title: "Sucesso", message: "Conta criado com sucesso!")
            // Envia usuário para tela inicial após login
            present(alert.alert(), animated: true) { [weak self] in
                let mainViewController = MainTabBarController()
                self?.navigationController?.setViewControllers([mainViewController], animated: true)
            }
        case .failure(let error):
            contentView.setLoading(false)
            showAlert(title: "Erro", message: error.localizedDescription)
            
        }
    }
    
    private func showAlert(title: String, message: String){
        let alert = CustomAlert(title: title, message: message)
        present(alert.alert(), animated: true)
    }
}
