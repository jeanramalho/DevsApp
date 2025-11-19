//
//  Authentication.swift
//  DevsApp
//
//  Created by Jean Ramalho on 18/11/25.
//
import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

class Authentication {
    
    private let auth = Auth.auth()
    private let firestore: Firestore = Firestore.firestore()
    
    public func login(userEmail: String, userPassword: String, completion: @escaping (Result<Void, AuthError>) -> Void) {
        
        auth.signIn(withEmail: userEmail, password: userPassword) { result , error in
            
            if let error = error as NSError? {
                
                switch AuthErrorCode(rawValue: error.code) {
                case .wrongPassword, .invalidEmail:
                    completion(.failure(.invalidCredentials))
                case .userNotFound:
                    completion(.failure(.userNotFound))
                default:
                    completion(.failure(.custom(message: error.localizedDescription)))
                } // Fim do Switch
                
                return
            } // Fim do if let error
            
            guard result?.user != nil else {
                completion(.failure(.userNotFound))
                return
            } // Fim do guard result.user
            
            completion(.success(()))
        }
    } // Fim da função Login
    
    
    public func checkLogin(completion: @escaping (Bool, String?) -> Void){
        
        auth.addStateDidChangeListener { auth, user in
            
            if let loggedUser = user {
                completion(true, loggedUser.uid)
                return
            } else {
                completion(false, nil)
                return
            } // Fim do if/else
            
        } // Fim do auth.addStateDidChangeListener
        
    } // Fim da função do checkLogin
    
}
