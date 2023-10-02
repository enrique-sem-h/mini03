//
//  HomeView.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 27/09/23.
//

import Foundation
import UIKit

class HomeView: UIView {
    let dateLabel = UILabel()
    
    let calendarButton = UIButton(type: .system)
    let filterButton = UIButton(type: .system)
    let petsButton = UIButton(type: .system)
    let configButton = UIButton(type: .system)
    let addTaskButton = UIButton(type: .custom)
    
    let celulas = [CustomTaskCell(), CustomTaskCell(), CustomTaskCell(), CustomTaskCell(), CustomTaskCell(), CustomTaskCell(), CustomTaskCell()] // Dados da TableView temporários
    
    let tasksTableView = UITableView()
    
    func setup() {
        self.backgroundColor = .systemBackground
        // Configuração da Label da data
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = "Setembro de 2023"
        dateLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        self.addSubview(dateLabel)
        
        // Botão do calendário
        calendarButton.setImage(UIImage(systemName: "calendar"), for: .normal)
        
        // Botão do filtro
        filterButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        
        // Botão dos pets
        petsButton.setImage(UIImage(systemName: "pawprint"), for: .normal)
        
        // Botão da config
        configButton.setImage(UIImage(systemName: "gear"), for: .normal)
        
        // StackView dos botões
        let buttonStackView = UIStackView(arrangedSubviews: [calendarButton, filterButton, petsButton, configButton])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .equalSpacing
        self.addSubview(buttonStackView)
        
        tasksTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tasksTableView)
        
        tasksTableView.register(CustomTaskCell.self, forCellReuseIdentifier: "CustomTaskCell")
        self.tasksTableView.separatorStyle = .none
        
        // Botão de adicionar tarefa
        addTaskButton.translatesAutoresizingMaskIntoConstraints = false
        addTaskButton.setImage(UIImage(named: "addTaskButton"), for: .normal)
        addTaskButton.frame = CGRect(x: 0, y: 0, width: 47, height: 47)
        self.addSubview(addTaskButton)
        
        NSLayoutConstraint.activate([
            // Constraints da data
            dateLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 14),
            dateLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            // Constraints da StackView dos botões do topo
            buttonStackView.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -18),
            
            // Constraints da TableView de tarefas
            tasksTableView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 30),
            tasksTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tasksTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tasksTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            // Constraints do botão de adicionar tarefa
            addTaskButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            addTaskButton.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
        ])
    }
}


