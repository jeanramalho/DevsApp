//
//  UIView+Extensions.swift
//  DevsApp
//
//  Created by Jean Ramalho on 07/10/25.
//
import Foundation
import UIKit

extension UIView {
    
    public func setConstraintsToParent(_ parent: UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: parent.topAnchor),
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ])
    }
    
}
