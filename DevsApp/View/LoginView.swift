//
//  LoginView.swift
//  DevsApp
//
//  Created by Jean Ramalho on 09/10/25.
//
import Foundation
import UIKit

class LoginView: UIView {
    
    private let logoDevsApp: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "DevsApp Complete Logo")
        return image
    }()
    
    private let emailTextFiel: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 6
        textField.backgroundColor = .white
        textField.textColor = Colors.bluePrimary
        return textField
    }()
    
    private let passwordTextFiel: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Senha"
        textField.layer.cornerRadius = 6
        textField.backgroundColor = .white
        textField.textColor = Colors.bluePrimary
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(Colors.bluePrimary, for: .normal)
        button.backgroundColor = Colors.bgColor
        button.layer.borderColor = Colors.bluePrimary.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastre-se", for: .normal)
        button.setTitleColor(.white, for: .normal)
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
        
        addSubview(logoDevsApp)
        addSubview(emailTextFiel)
        addSubview(passwordTextFiel)
        addSubview(loginButton)
        addSubview(signUpButton)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            
            logoDevsApp.heightAnchor.constraint(equalToConstant: 200),
            logoDevsApp.widthAnchor.constraint(equalToConstant: 230),
            logoDevsApp.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            logoDevsApp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextFiel.heightAnchor.constraint(equalToConstant: 35),
            emailTextFiel.widthAnchor.constraint(equalToConstant: 300),
            emailTextFiel.topAnchor.constraint(equalTo: logoDevsApp.bottomAnchor, constant: 20),
            emailTextFiel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            passwordTextFiel.heightAnchor.constraint(equalToConstant: 35),
            passwordTextFiel.widthAnchor.constraint(equalToConstant: 300),
            passwordTextFiel.topAnchor.constraint(equalTo: emailTextFiel.bottomAnchor, constant: 15),
            passwordTextFiel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 260),
            loginButton.topAnchor.constraint(equalTo: passwordTextFiel.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15)
            
            
        ])
    }
        
}


