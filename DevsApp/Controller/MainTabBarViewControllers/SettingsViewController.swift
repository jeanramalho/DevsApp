//
//  SettingsViewController.swift
//  DevsApp
//
//  Created by Jean Ramalho on 19/10/25.
//
import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    private let contentView: SettingsView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        title = "Configurações"
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.setConstraintsToParent(self.view)
        
    }
    
}
