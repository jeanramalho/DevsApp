//
//  LoginView.swift
//  DevsApp
//
//  Created by Jean Ramalho on 09/10/25.
//
import Foundation
import UIKit

class LoginView: UIView {
    
    //MARK: - Subviews
    private let logoDevsApp: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "DevsApp Complete Logo")
        return image
    }()
    
    private let emailTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 6
        textField.backgroundColor = .white
        textField.textColor = Colors.bluePrimary
        textField.accessibilityLabel = "emailField"
        return textField
    }()
    
    private let passwordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.placeholder = "Senha"
        textField.layer.cornerRadius = 6
        textField.backgroundColor = .white
        textField.textColor = Colors.bluePrimary
        textField.accessibilityLabel = "emailField"
        return textField
    }()
    
    private let showPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mostrar Senha"
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private let showPasswordSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.onTintColor = Colors.bluePrimary
        return switchControl
    }()
    
    private let showPassWordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
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
        button.accessibilityIdentifier = "loginButton"
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastre-se", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.accessibilityIdentifier = "singupButton"
        return button
    }()
    
    // MARK: - Callbacks
    // Notice: onShowPasswordToggle returns the new boolean state
    
    public var onShowPasswordToggle: ((Bool) -> Void)?
    public var onLoginTap: (() -> Void)?
    public var onSignUpTap: (() -> Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setupUI(){
        
        backgroundColor = Colors.bgColor
        
        setHierarchy()
        setConstraints()
    }
    
    private func setupActions(){
        showPasswordSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
    }
    
    private func setHierarchy(){
        
        showPassWordStackView.addArrangedSubview(showPasswordLabel)
        showPassWordStackView.addArrangedSubview(showPasswordSwitch)
        
        addSubview(logoDevsApp)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(signUpButton)
        addSubview(showPassWordStackView)
        
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            
            logoDevsApp.heightAnchor.constraint(equalToConstant: 200),
            logoDevsApp.widthAnchor.constraint(equalToConstant: 230),
            logoDevsApp.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            logoDevsApp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 35),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.topAnchor.constraint(equalTo: logoDevsApp.bottomAnchor, constant: 20),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            showPassWordStackView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            showPassWordStackView.widthAnchor.constraint(equalToConstant: 250),
            showPassWordStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 260),
            loginButton.topAnchor.constraint(equalTo: showPassWordStackView.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15)
            
            
        ])
    }
    
    // MARK: - Actions
    
    @objc private func switchChanged(_ sender: UISwitch){
        onShowPasswordToggle?(sender.isOn)
    }
    
    @objc private func loginTapped(){
        onLoginTap?()
    }
    
    @o
    
    
    public func getUserCredentials() -> Credentials? {
        
        guard let userName = self.emailTextField.text,
        let password = self.passwordTextField.text
        else {return nil}
        
        let userCredentials = Credentials(userName: userName, password: password)
        
        return userCredentials
    } // Fim da função getUserCredentials
    
    public func setPasswordVisibility(_ visible: Bool){
      
        let currentlyFirstResponder = self.passwordTextField.isFirstResponder
        let currentText = self.passwordTextField.text
        
        if currentlyFirstResponder {self.passwordTextField.resignFirstResponder()}
        self.passwordTextField.isSecureTextEntry = !visible
        self.passwordTextField.text = currentText
        if currentlyFirstResponder {self.passwordTextField.becomeFirstResponder()}
      
    } // Fim da função setPasswordVisibility
}


