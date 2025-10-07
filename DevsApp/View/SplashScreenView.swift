//
//  SplashScreenView.swift
//  DevsApp
//
//  Created by Jean Ramalho on 07/10/25.
//
import Foundation
import UIKit

class SplashScreenView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        self.backgroundColor = .red
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
    }
    
    private func setConstraints(){
        
    }
}
