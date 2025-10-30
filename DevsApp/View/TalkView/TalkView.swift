//
//  ChatTalkView.swift
//  DevsApp
//
//  Created by Jean Ramalho on 28/10/25.
//
import Foundation
import UIKit


final class TalkView: UIView {
    
    // MARK: - Fundo (mantive exatamente como você já tinha)
    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "chatBackground")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = false
        return image
    }()
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewCode setup (mantendo o padrão)
    private func setupUI() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            // background
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}
