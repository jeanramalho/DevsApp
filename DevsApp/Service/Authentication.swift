//
//  Authentication.swift
//  DevsApp
//
//  Created by Jean Ramalho on 18/11/25.
//
import Foundation
import FirebaseAuth
import FirebaseFirestore

class Authentication: AuthenticationService {
    
    private let auth = Auth.auth()
    private let firestore: Firestore = Firestore.firestore()
    
    
    // MARK: - CREATE USER
    public func createUser(user: User, completion: @escaping (Result<Void, AuthError>) -> Void ){
    
        
        auth.createUser(withEmail: user.email, password: user.password) { [weak self] dataResult, error in
            
            guard let self = self else {return}
            
            if let error = error as NSError? {
                // Mapeia o erro do firebase para o AuthError
                let authError: AuthError
                switch AuthErrorCode(rawValue: error.code) {
                case .invalidEmail:
                    authError = .custom(message: "Email Inválido.")
                case .weakPassword:
                    authError = .custom(message: "Senha fraca! Use pelo menos 6 caracteres!")
                default:
                    authError = .custom(message: error.localizedDescription)
                }
                DispatchQueue.main.async {
                    completion(.failure(authError))
                }
                return
            }
            
            // Recupera ID do usuário
            guard let userId = dataResult?.user.uid else {
                DispatchQueue.main.async {
                    completion(.failure(.custom(message: "Não foi possível recuperar ID do usuário.")))
                }
                return
            }
            
            // Cria documento no Firestore
            self.firestore.collection("users")
                .document(userId)
                .setData([
                    "nome": user.name,
                    "email": user.email
                ]) {error in
                    DispatchQueue.main.async {
                        if let error = error {
                            completion(.failure(.custom(message: error.localizedDescription)))
                        } else {
                            completion(.success(()))
                        }
                    }
                }
            
        }
    }
    
    // MARK: - LOGIN
    
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
            
            DispatchQueue.main.async {
                completion(.success(()))
            }
        }
    } // Fim da função Login
    
   // MARK: - CHECK LOGIN
    
    public func checkLogin(completion: @escaping (_ auth: Bool, _ userId: String?) -> Void){
        
        auth.addStateDidChangeListener { auth, user in
            
            if let loggedUser = user {
                completion(true, loggedUser.uid)
                return
            } else {
                completion(false, nil)
            } // Fim do if/else
            
        } // Fim do auth.addStateDidChangeListener
        
    } // Fim da função do checkLogin
    
}
