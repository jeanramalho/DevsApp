//
//  SingUpViewModel.swift
//  DevsApp
//
//  Created by Jean Ramalho on 09/12/25.
//
import Foundation
import UIKit
import Combine



final class SignUpViewModel: SignUpViewModelType {
    
    // Estado do fluxo de sign up
    let signUpState = CurrentValueSubject<SignUpState, Never>(.idle)
    
    // Dependencia para facilitar testes
    private let authService: AuthenticationService
    
    init(authService: AuthenticationService = Authentication()) {
        self.authService = authService
    }
    
    // MARK: - SignUp
    func signUp(name: String, email: String, password: String, confirmPassword: String){
        
        // Validações do parametros
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedConfirm = confirmPassword.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedName.isEmpty else {
            signUpState.send(.failure(.custom(message: "Informe seu nome!")))
            return
        }
        
        guard !trimmedEmail.isEmpty else {
            signUpState.send(.failure(.custom(message: "Infrome seu email!")))
            return
        }
        
        guard trimmedPassword.count >= 6 else {
            signUpState.send(.failure(.custom(message: "A senha deve ter pelo menos 6 caracteres!")))
            return
        }
        
        guard trimmedPassword == trimmedConfirm else {
            signUpState.send(.failure(.custom(message: "As senhas não conferem!")))
            return
        }
        
        // Cria modelo de User
        let newUser = User(name: trimmedName, email: trimmedEmail, password: trimmedPassword)
        
        
        // Se passar nas validações -> Solicita criação
        signUpState.send(.loading)
        
        authService.createUser(user: newUser) { [weak self] result in
            
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.signUpState.send(.success)
                case .failure(let error):
                    self.signUpState.send(.failure(error))
                }
            }
        }
    }
}
