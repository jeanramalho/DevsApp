//
//  LoginViewModelType.swift
//  DevsApp
//
//  Created by Jean Ramalho on 16/12/25.
//
import Foundation

protocol LoginViewModelType {
    var isPasswordVisible: CurrentValueSubject<Bool, Never> {get}
    var isAuthenticated: CurrentValueSubject<Bool, Never> {get}
    var loginState: CurrentValueSubject<LoginState, Never> {get}
    func setPasswordVisibility(_ visible: Bool)
    func togglePasswordVisibility()
    func login(user: String, password: String)
    func checkAuthentication()
}
