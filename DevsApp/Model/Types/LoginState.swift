//
//  LoginState.swift
//  DevsApp
//
//  Created by Jean Ramalho on 09/12/25.
//
import Foundation

enum LoginState {
    case idle
    case loading
    case success
    case failure(AuthError)
}
