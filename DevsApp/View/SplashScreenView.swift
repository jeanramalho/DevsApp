//
//  SplashScreenView.swift
//  DevsApp
//
//  Created by Jean Ramalho on 07/10/25.
//
import Foundation
import UIKit

class SplashScreenView: UIView {
    
    private let logoDevsApp: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "DevsApp Complete Logo")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        self.backgroundColor = Colors.bgColor
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
        addSubview(logoDevsApp)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            logoDevsApp.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            logoDevsApp.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25),
            logoDevsApp.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logoDevsApp.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
