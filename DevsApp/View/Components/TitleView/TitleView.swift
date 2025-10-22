//
//  TitleView.swift
//  DevsApp
//
//  Created by Jean Ramalho on 21/10/25.
//
import Foundation
import UIKit

class TitleView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   init(title: String) {
        super.init(frame: .zero)
        setupComponent(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponent(title: String){
        titleLabel.text = title
    }
    
}
