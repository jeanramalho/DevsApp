//
//  UIViewController+Extensions.swift
//  DevsApp
//
//  Created by Jean Ramalho on 22/10/25.
//
import Foundation
import UIKit

extension UIViewController {
    
    public func setNavigationTabBarToHidden(isHidden: Bool){
        
        self.navigationController?.navigationBar.isHidden = isHidden
    }
}
