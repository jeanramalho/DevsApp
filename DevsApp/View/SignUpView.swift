//
//  SignUpView.swift
//  DevsApp
//
//  Created by Jean Ramalho on 16/10/25.
//
import Foundation
import UIKit

class SignUpView: UIView {
    
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
        textField.layer.cornerRadius = 6
        textField.textColor = Colors.bluePrimary
        return textField
    }()
    
    private let passwordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite sua senha..."
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.textColor = Colors.bluePrimary
        return textField
    }()
    
    private let confirmPasswordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirme sua senha..."
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
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        backgroundColor = Colors.bgColor
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(signUpButton)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            
            // Define altura dos elementos
            nameTextField.heightAnchor.constraint(equalToConstant: 35),
            emailTextField.heightAnchor.constraint(equalToConstant: 35),
            passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 35),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Define alinhamento dos elementos
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            confirmPasswordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // Define constraints dos elementos
            nameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 30),
            signUpButton.widthAnchor.constraint(equalToConstant: 300)
            
        ])
    }
}
