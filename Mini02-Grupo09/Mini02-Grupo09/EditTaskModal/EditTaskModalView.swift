//
//  EditTaskModalView.swift
//  testeLista
//
//  Created by Gabriel Eduardo on 27/09/23.
//

import Foundation
import UIKit

class EditTaskModalView: UIView {
    let hourLabel = UILabel()
    let iconImage = UIView()
    let titleLabel = UILabel()
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
        
        // Constraints
        NSLayoutConstraint.activate([
            
            // Constraints do título da tarefa
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 30),
            
            // Constraints do botão de editar tarefa
            editButton.heightAnchor.constraint(equalToConstant: 56),
            editButton.widthAnchor.constraint(equalToConstant: 306),
            
            // Constraints do botão de apagar tarefa
            deleteButton.heightAnchor.constraint(equalToConstant: 56),
            deleteButton.widthAnchor.constraint(equalToConstant: 306),
            
            // Constraints da StackView dos botões
            buttonStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}
