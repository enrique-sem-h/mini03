//
//  EditTaskModalView.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 27/09/23.
//

import Foundation
import UIKit

class EditTaskModalView: UIView {

    let iconImage = UIView()
    let hourLabel = UILabel()
    let titleLabel = UILabel()
    let closeModalButton = UIButton()
    let editButton = UIButton()
    let deleteButton = UIButton()
    
    func setup() {
        // Configuração da modal
        self.backgroundColor = .white
        
        // Configuração da label do ícone (Necessita de alteração pós asset)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.backgroundColor = UIColor.blue
        iconImage.layer.cornerRadius = 21
        iconImage.clipsToBounds = true
        self.addSubview(iconImage)
        
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
        let topStackView = UIStackView(arrangedSubviews: [iconImage, hourTitleStackView, closeModalButton])
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
        editButton.setTitle("Editar Tarefa", for: .normal)
        editButton.titleLabel?.font = editButton.titleLabel!.font.withSize(18)
        editButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        editButton.layer.cornerRadius = 14
        self.addSubview(editButton)
        
        // Configuração do botão de apagar
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.backgroundColor = UIColor.gray
        deleteButton.setTitle("Apagar Tarefa", for: .normal)
        deleteButton.titleLabel?.font = deleteButton.titleLabel!.font.withSize(18)
        deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
        deleteButton.layer.cornerRadius = 14
        self.addSubview(deleteButton)
        

        // Configuração da StackView que abriga os botões
        let buttonStackView = UIStackView(arrangedSubviews: [editButton, deleteButton])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 10
        self.addSubview(buttonStackView)

        // Configuração da StackView que abriga tudo
        let allStackView = UIStackView(arrangedSubviews: [topStackView, separator, editButton, deleteButton])
        allStackView.translatesAutoresizingMaskIntoConstraints = false
        allStackView.axis = .vertical
        allStackView.spacing = 10
        self.addSubview(allStackView)

        
        // Constraints
        NSLayoutConstraint.activate([
            

            // Constraints do título da tarefa
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 30),

            // Constraints do icon (necessita alteração pós asset)
            iconImage.widthAnchor.constraint(equalToConstant: 42), // Necessita de alteração pós asset
            iconImage.heightAnchor.constraint(equalToConstant: 42), // Necessita de alteração pós asset

            
            // Constraints do botão de editar tarefa
            editButton.heightAnchor.constraint(equalToConstant: 56),
            editButton.widthAnchor.constraint(equalToConstant: 306),
            
            // Constraints do botão de apagar tarefa
            deleteButton.heightAnchor.constraint(equalToConstant: 56),
            deleteButton.widthAnchor.constraint(equalToConstant: 306),
            

            // Constraints da StackView dos botões
            buttonStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)

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
