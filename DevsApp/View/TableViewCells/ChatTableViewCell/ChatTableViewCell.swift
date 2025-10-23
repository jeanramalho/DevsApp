//
//  ChatTableViewCell.swift
//  DevsApp
//
//  Created by Jean Ramalho on 23/10/25.
//
import Foundation
import UIKit

class ChatTableViewCell: UITableViewCell {
    
    static let identifier: String = "ChatTableViewCell"
    
    private let contactPhotoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "perfil")
        image.layer.cornerRadius = 35
        image.layer.borderColor = Colors.bluePrimary.cgColor
        image.layer.borderWidth = 1
        return image
    }()
    
    private let contactNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do Contato"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let lastMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Testando a ultima mensagem aqui pra ver se funciona"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        label.textColor = .systemGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        addSubview(contactPhotoImageView)
        addSubview(contactNameLabel)
        addSubview(lastMessageLabel)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            contactPhotoImageView.heightAnchor.constraint(equalToConstant: 70),
            contactPhotoImageView.widthAnchor.constraint(equalToConstant: 70),
            contactPhotoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            contactPhotoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            contactPhotoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            contactNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            contactNameLabel.leadingAnchor.constraint(equalTo: contactPhotoImageView.trailingAnchor, constant: 24),
            contactNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            lastMessageLabel.leadingAnchor.constraint(equalTo: contactPhotoImageView.trailingAnchor, constant: 16),
            lastMessageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            lastMessageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24)
        ])
    }
}
