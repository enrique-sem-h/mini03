//
//  EditTaskModalView.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 27/09/23.
//

import Foundation
import UIKit

class EditTaskModalView: UIView {
    let iconView = UIImageView()
    let hourLabel = UILabel()
    let titleLabel = UILabel()
    let closeModalButton = UIButton()
    let editButton = UIButton()
    let deleteButton = UIButton()
    
    func setup() {
        // Configuração da modal
        self.backgroundColor = .white
        
        // Configuração da label do ícone (Necessita de alteração pós asset)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(iconView)
        
        // Configuração da label do horário
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
        hourLabel.font = hourLabel.font.withSize(12)
        self.addSubview(hourLabel)
        
        // Configuração da label do título
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = titleLabel.font.withSize(12)
        self.addSubview(titleLabel)
        
        // Configuração da StackView que abriga o horário e o título
        let hourTitleStackView = UIStackView(arrangedSubviews: [hourLabel, titleLabel])
        hourTitleStackView.translatesAutoresizingMaskIntoConstraints = false
        hourTitleStackView.axis = .vertical
        hourTitleStackView.spacing = 2
        self.addSubview(hourTitleStackView)
        
        // Configuração do botão de fechar modal
        closeModalButton.translatesAutoresizingMaskIntoConstraints = false
        closeModalButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        self.addSubview(closeModalButton)
        
        
        // Configuração da StackView que abriga icone, StackView de horário e título e botão de fechar
        let topStackView = UIStackView(arrangedSubviews: [iconView, hourTitleStackView, closeModalButton])
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.axis = .horizontal
        topStackView.spacing = 24
        self.addSubview(topStackView)
        
        // Configuração do separador
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .gray
        self.addSubview(separator)
        
        // Configuração do botão de editar
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.backgroundColor = UIColor.gray
        editButton.setTitle(String(localized: "Edit Task"), for: .normal)
        editButton.titleLabel?.font = editButton.titleLabel!.font.withSize(18)
        editButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        editButton.tintColor = .black
        editButton.layer.cornerRadius = 14
        self.addSubview(editButton)
        
        // Configuração do botão de apagar
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.backgroundColor = UIColor.gray
        deleteButton.setTitle(String(localized: "Delete Task"), for: .normal)
        deleteButton.titleLabel?.font = deleteButton.titleLabel!.font.withSize(18)
        deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
        deleteButton.tintColor = .black
        deleteButton.layer.cornerRadius = 14
        self.addSubview(deleteButton)
        
        // Configuração da StackView que abriga tudo
        let allStackView = UIStackView(arrangedSubviews: [topStackView, separator, editButton, deleteButton])
        allStackView.translatesAutoresizingMaskIntoConstraints = false
        allStackView.axis = .vertical
        allStackView.spacing = 10
        self.addSubview(allStackView)
        
        // Constraints
        NSLayoutConstraint.activate([
            
            // Constraints do icon (necessita alteração pós asset)
            iconView.widthAnchor.constraint(equalToConstant: 21), // Necessita de alteração pós asset
            iconView.heightAnchor.constraint(equalToConstant: 21), // Necessita de alteração pós asset
            
            // Constraints do botão de editar tarefa
            editButton.heightAnchor.constraint(equalToConstant: 56),
            editButton.widthAnchor.constraint(equalToConstant: 306),
            
            // Constraints do botão de apagar tarefa
            deleteButton.heightAnchor.constraint(equalToConstant: 56),
            deleteButton.widthAnchor.constraint(equalToConstant: 306),
            
            // Constraints do separador
            separator.widthAnchor.constraint(equalToConstant: 292),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            // Constraints da topStackView
            topStackView.leadingAnchor.constraint(equalTo: editButton.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: editButton.trailingAnchor),
            
            // Constraints da allStackView
            allStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            allStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
}
