//
//  SignUpState.swift
//  DevsApp
//
//  Created by Jean Ramalho on 09/12/25.
//
import Foundation

enum SignUpState {
    case idle
    case loading
    case success
    case failure(AuthError)
}
