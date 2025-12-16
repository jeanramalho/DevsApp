//
//  SignUpViewModelType.swift
//  DevsApp
//
//  Created by Jean Ramalho on 16/12/25.
//
import Foundation
import Combine

protocol SignUpViewModelType {
    
    var signUpState: CurrentValueSubject<SignUpState, Never> { get }
    func signUp(name: String, email: String, password: String, confirmPassword: String)
}
