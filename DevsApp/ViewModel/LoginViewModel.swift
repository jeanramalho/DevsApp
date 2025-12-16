//
//  LoginViewModel.swift
//  DevsApp
//
//  Created by Jean Ramalho on 25/11/25.
//
import Foundation
import UIKit
import Combine


final class LoginViewModel: LoginViewModelType {
    
    
    // MARK: - Outputs (Publishers)
    let isPasswordVisible = CurrentValueSubject<Bool, Never>(false)
    let isAuthenticated = CurrentValueSubject<Bool, Never>(false)
    let loginState = CurrentValueSubject<LoginState, Never>(.idle)
    
    // MARK: - Dependences
    let auth: Authentication
    
    // MARK: - Init
    init(auth: Authentication = Authentication()){
        self.auth = auth
    }
    
    // MARK: - Passowrd visibility control
    func setPasswordVisibility(_ visible: Bool){
        isPasswordVisible.send(visible)
    }
    
    func togglePasswordVisibility() {
        isPasswordVisible.send(!isPasswordVisible.value)
    }
    
    // MARK: - Login
    public func login(user: String, password: String){
        
        let emailTrimmed = user.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordTrimmed = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !emailTrimmed.isEmpty, !passwordTrimmed.isEmpty else {
            loginState.send(.failure(.custom(message: "Preencha os campos de email e senha para realizar login")))
            return
        }
        
        loginState.send(.loading)

        self.auth.login(userEmail: emailTrimmed, userPassword: passwordTrimmed) { [weak self] result in
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.loginState.send(.success)
                case .failure(let error):
                    self.loginState.send(.failure(error))
                }
            }
            
        } //Fim da função de login do service

    } // Fim da função de login
    
    // MARK: - Check Authentication
    public func checkAuthentication() {
        
        self.auth.checkLogin { [weak self] authFlag, _ in
            
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                self.isAuthenticated.send(authFlag)
            }
            
        } // Fim do checkLogin do auth
        
    } // Fim da função checkAuthentication

  
    
} // Fim da Classe LoginViewModel
