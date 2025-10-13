//
//  LoginView.swift
//  DevsApp
//
//  Created by Jean Ramalho on 09/10/25.
//
import Foundation
import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        backgroundColor = Colors.bgColor
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
    }
    
    private func setConstraints(){
        
    }
        
}


