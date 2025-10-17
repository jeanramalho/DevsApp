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
        return textField
    }()
    
    private let emailTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu email..."
        return textField
    }()
    
    private let passwordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite sua senha..."
        return textField
    }()
    
    private let confirmPasswordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirme sua senha..."
        return textField
    }()
    
    private let singUpButton: UIButton = {
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
