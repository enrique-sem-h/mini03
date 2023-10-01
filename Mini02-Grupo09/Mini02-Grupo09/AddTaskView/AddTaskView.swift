//
//  AddTaskView.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 29/09/23.
//

import Foundation
import UIKit

class AddTaskView: UIView {
    let viewTitle = UILabel() // Título da view (Criar tarefa ou Editar tarefa)
    let closeModalButton = UIButton() // Botão para fechar a modal
    
    let taskTitleTF = UITextField() // TextField do título da tarefa
    let iconPicker = UIButton(type: .custom) // Picker de ícones
    let addPetButton = UIButton() // Botão para adicionar pet
    let datePicker = UIDatePicker() // Picker de data
    let frequencyPicker = UISegmentedControl(items: ["Once", "Daily", "Weekly", "Monthly", "Anually"]) // Picker da frequência
    let notesTF = UITextField() // TextField das anotações
    
    weak var viewController: AddTaskViewController?
    
    func setup() {
        self.backgroundColor = .systemBackground
        
        // Configuração do título da view
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        viewTitle.text = "Criar Tarefa"
        viewTitle.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        viewTitle.textAlignment = .center
        viewTitle.backgroundColor = .gray
        self.addSubview(viewTitle)
        
        // Configuração do botão de fechar modal
        closeModalButton.translatesAutoresizingMaskIntoConstraints = false
        closeModalButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        closeModalButton.tintColor = .black
        self.addSubview(closeModalButton)
        
        // Tarefa Label
        let tarefaLabel = UILabel()
        tarefaLabel.translatesAutoresizingMaskIntoConstraints = false
        tarefaLabel.text = "Tarefa"
        tarefaLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        self.addSubview(tarefaLabel)
        
        // Configuração do iconPicker
        iconPicker.translatesAutoresizingMaskIntoConstraints = false
        iconPicker.setImage(UIImage(named: "iconPicker"), for: .normal)
        iconPicker.frame = CGRect(x: 0, y: 0, width: 47, height: 47)
        self.addSubview(iconPicker)
        
        // Configuração do TextField do título
        taskTitleTF.translatesAutoresizingMaskIntoConstraints = false
        taskTitleTF.frame = CGRect(x: 0, y: 0, width: 265, height: 40)
        taskTitleTF.placeholder = "Digite algo aqui"
        taskTitleTF.addBottomBorderWithColor(color: .gray)
        taskTitleTF.delegate = viewController
        taskTitleTF.returnKeyType = .done
        self.addSubview(taskTitleTF)
        
        // StackView iconPicker e taskTitleTF
        let iPtTStackView = UIStackView(arrangedSubviews: [iconPicker, taskTitleTF])
        iPtTStackView.translatesAutoresizingMaskIntoConstraints = false
        iPtTStackView.axis = .horizontal
        iPtTStackView.spacing = 8
        self.addSubview(iPtTStackView)
        
        // Configuração do Botão de adicionar pet
        
        // Configuração do datePicker
//        datePicker.translatesAutoresizingMaskIntoConstraints = false
//        datePicker.locale = .autoupdatingCurrent
//        datePicker.datePickerMode = .dateAndTime // Altere para .time ou .dateAndTime conforme necessário
//        datePicker.preferredDatePickerStyle = .compact
//        datePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())
//        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())
////        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
//        self.addSubview(datePicker)
        
        // Configuração do frequencyPicker
//        frequencyPicker.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(frequencyPicker)
        
        // Configuração do TextField das anotações
//        notesTF.translatesAutoresizingMaskIntoConstraints = false
//        notesTF.placeholder = "Digite suas anotações aqui"
//        notesTF.textAlignment = .natural
//        notesTF.borderStyle = .roundedRect
//        notesTF.delegate = viewController
//        notesTF.returnKeyType = .done
//        self.addSubview(notesTF)
        
        
        NSLayoutConstraint.activate([
            
            // Constraints do botão de fechar modal
            closeModalButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 28),
            closeModalButton.centerYAnchor.constraint(equalTo: viewTitle.centerYAnchor),
            
            // Constraints do título da view
            viewTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewTitle.topAnchor.constraint(equalTo: self.topAnchor),
            viewTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewTitle.heightAnchor.constraint(equalToConstant: 74),
            
            // Constraints da Label "Tarefa"
            tarefaLabel.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 60),
            tarefaLabel.leadingAnchor.constraint(equalTo: iconPicker.leadingAnchor),
            
            // Constraints da StackView do iconPicker e do taskTitleTF e seus elementos
            taskTitleTF.widthAnchor.constraint(equalToConstant: 265),
            
            iPtTStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            iPtTStackView.topAnchor.constraint(equalTo: tarefaLabel.bottomAnchor, constant: 10),
            
            // Constraints do TextField das anotações
            notesTF.widthAnchor.constraint(equalToConstant: 336),
            notesTF.heightAnchor.constraint(equalToConstant: 80)
            
            
        ])
        
        
        
    }
}
