//
//  SignUpView.swift
//  DevsApp
//
//  Created by Jean Ramalho on 16/10/25.
//
import Foundation
import UIKit

final class SignUpView: UIView {
    
    // MARK: - Subviews
    private let headerView: HeaderView = {
        let headerView = HeaderView(title: "Cadastre-se")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let nameTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu nome..."
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.textColor = Colors.bluePrimary
        return textField
    }()
    
    private let emailTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu email..."
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .white
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 6
        textField.textColor = Colors.bluePrimary
        return textField
    }()
    
    private let passwordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite sua senha..."
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.textColor = Colors.bluePrimary
        return textField
    }()
    
    private let confirmPasswordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirme sua senha..."
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.textColor = Colors.bluePrimary
        return textField
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.backgroundColor = Colors.bgColor
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = Colors.bluePrimary.cgColor
        button.setTitleColor(Colors.bluePrimary, for: .normal)
        return button
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    // MARK: - Callbacks
    public var onSignUpTap: (() -> Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI(){
        
        backgroundColor = Colors.bgColor
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
        addSubview(headerView)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(signUpButton)
        
        signUpButton.addSubview(activityIndicator)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            
            //Define contraints do headerView
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            // nameTextField
            nameTextField.heightAnchor.constraint(equalToConstant: 35),
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            nameTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 50),
            
            // emailTextField
            emailTextField.heightAnchor.constraint(equalToConstant: 35),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            
            // passwordTextField
            passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            
            // confirmPasswordTextField
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 35),
            confirmPasswordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            confirmPasswordTextField.widthAnchor.constraint(equalToConstant: 300),
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            
            // signUpButton
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 30),
            signUpButton.widthAnchor.constraint(equalToConstant: 300),
            
            // activity indicator
            activityIndicator.centerXAnchor.constraint(equalTo: signUpButton.centerXAnchor),
            activityIndicator.trailingAnchor.constraint(equalTo: signUpButton.trailingAnchor, constant: -12)
            
        ])
    }
    
    private func setupActions(){
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
    }
    
    @objc private func signUpTapped(){
        onSignUpTap?()
    }
}
