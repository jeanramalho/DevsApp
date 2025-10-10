//
//  SplashScreenViewController.swift
//  DevsApp
//
//  Created by Jean Ramalho on 07/10/25.
//
import Foundation
import UIKit

class SplashScreenViewController: UIViewController {
    
    private let contentView: SplashScreenView = SplashScreenView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        dismissModal()
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
    
    private func dismissModal(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
