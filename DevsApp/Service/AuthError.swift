//
//  AuthError.swift
//  DevsApp
//
//  Created by Jean Ramalho on 18/11/25.
//
import Foundation

enum AuthError: Error {
    
    case invalidCredentials
    case userNotFound
    case unknowError
    case custom(message: String)
    
    var localizedDescription: String {
        switch self {
        case .invalidCredentials:
            return "Email ou Senha inválidos!"
        case .userNotFound:
            return "Usuário não encontrado!"
        case .unknowError:
            return "Erro desconhecido. Tente Novamente!"
        case .custom(let message):
            return message
        }
        
    }
}
