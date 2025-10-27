//
//  ContactsTableViewCell.swift
//  DevsApp
//
//  Created by Jean Ramalho on 27/10/25.
//
import Foundation
import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    static let identifier: String = "ContactsTableViewCell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell(){
        
        backgroundColor = Colors.bgColor
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
        addSubview(contactPhotoImageView)
        addSubview(contactNameLabel)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            
            contactPhotoImageView.heightAnchor.constraint(equalToConstant: 70),
            contactPhotoImageView.widthAnchor.constraint(equalToConstant: 70),
            contactPhotoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            contactPhotoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            contactPhotoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            contactNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            contactNameLabel.leadingAnchor.constraint(equalTo: contactPhotoImageView.trailingAnchor, constant: 24),
            contactNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
