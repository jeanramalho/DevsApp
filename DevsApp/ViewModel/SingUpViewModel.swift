//
//  SingUpViewModel.swift
//  DevsApp
//
//  Created by Jean Ramalho on 09/12/25.
//
import Foundation
import UIKit
import Combine



final class SignUpViewModel: SignUpViewModelType {
    
    // Estado do fluxo de sign up
    let signUpState = CurrentValueSubject<SignUpState, Never>(.idle)
    
    
}
