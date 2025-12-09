//
//  AuthenticationService.swift
//  DevsApp
//
//  Created by Jean Ramalho on 09/12/25.
//
import Foundation

protocol AuthenticationService {
    
    func createUser(user: User, completion: @escaping (Result<Void, AuthError>) -> Void)
    
    func login(userEmail: String, userPassword: String, completion: @escaping (Result<Void, AuthError>) -> Void)
    
    func checkLogin(completion: @escaping (_ auth: Bool, _ userId: String?) -> Void)
}
