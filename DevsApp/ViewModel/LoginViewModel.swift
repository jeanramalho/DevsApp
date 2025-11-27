//
//  LoginViewModel.swift
//  DevsApp
//
//  Created by Jean Ramalho on 25/11/25.
//
import Foundation
import UIKit

final class LoginViewModel: NSObject {
    
    private let auth: Authentication = Authentication()
    
    override init(){
        super.init()
    }
    
    public func checkAuthentication(currentViewController: UIViewController ,destinyViewController: UIViewController){
        
        self.auth.checkLogin { auth, userId in
            
            guard let userId = userId else {return}
            
            if auth {
                DispatchQueue.main.async {
                    currentViewController.navigationController?.setViewControllers([destinyViewController], animated: true)
                }
            } else {
                print("Usuário não está logado")
            } // Fim do if/else que confirma autenticação
            
        } // Fim do checkLogin do auth
        
    } // Fim da função checkAuthentication

    public func login(user: String, password: String){

        self.auth.login(userEmail: user, password: password) {
            
        }        

    } // Fim da função de login
    
} // Fim da Classe LoginViewModel
