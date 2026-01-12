//
//  SettingsView.swift
//  DevsApp
//
//  Created by Jean Ramalho on 20/10/25.
//
import Foundation
import UIKit

class SettingsView: UIView {
    
    private let headerView: HeaderView = {
        let headerView = HeaderView(title: "Configurações")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let perfilImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
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
        
        backgroundColor = Colors.bgColor
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
        addSubview(headerView)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
