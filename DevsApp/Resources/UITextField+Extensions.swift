//
//  UITextField+Extensions.swift
//  DevsApp
//
//  Created by Jean Ramalho on 14/10/25.
//
import UIKit
import Foundation

class PaddedTextField: UITextField {
    
    var padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
