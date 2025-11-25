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
    
    public func checkAuthentication(viewController: UIViewController){
        
        self.auth.checkLogin { auth, userId in
            <#code#>
        }
    }
}
