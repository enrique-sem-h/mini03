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
    let iconPicker = IconPicker() // Picker de ícones
    let addPetButton = UIButton(type: .custom) // Botão para adicionar pet
    let datePicker = UIDatePicker() // Picker de data
    let notesTF = UITextField() // TextField das anotações
    
    let doneButton = UIButton(type: .custom)
    
    let petsStackView = UIStackView()
    
    weak var viewController: AddTaskViewController?
    
    func setup() {
        self.backgroundColor = .systemBackground
        
        // Configuração do título da view
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        viewTitle.font = UIFont(name: "Animal-Bold", size: 24)
        viewTitle.textColor = UIColor(named: "HeaderTitle")
        viewTitle.textAlignment = .center
        viewTitle.backgroundColor = UIColor(named: "ViewHeader")
        self.addSubview(viewTitle)
        
        // Configuração do botão de fechar modal
        closeModalButton.translatesAutoresizingMaskIntoConstraints = false
        closeModalButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        closeModalButton.tintColor = UIColor(named: "Red")
        self.addSubview(closeModalButton)
        
        // Tarefa Label
        let tarefaLabel = UILabel()
        tarefaLabel.translatesAutoresizingMaskIntoConstraints = false
        tarefaLabel.text = String(localized: "Task")
        tarefaLabel.font = UIFont(name: "Animal-Bold", size: 20)
        tarefaLabel.textColor = UIColor(named: "NegativeBackground")
        self.addSubview(tarefaLabel)
        
        // Configuração do iconPicker
        iconPicker.viewController = self.viewController
        self.addSubview(iconPicker)
        
        // Configuração do TextField do título
        taskTitleTF.translatesAutoresizingMaskIntoConstraints = false
        taskTitleTF.frame = CGRect(x: 0, y: 0, width: 265, height: 40)
        taskTitleTF.placeholder = String(localized: "Type something")
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
        
        // Pet Label
        let petsLabel = UILabel()
        petsLabel.translatesAutoresizingMaskIntoConstraints = false
        petsLabel.text = String(localized: "Pets")
        petsLabel.font = UIFont(name: "Animal-Bold", size: 20)
        petsLabel.isAccessibilityElement = true
        self.addSubview(petsLabel)
        
        // Configuração do Botão de adicionar pet
        addPetButton.translatesAutoresizingMaskIntoConstraints = false
        addPetButton.setImage(UIImage(named: "addPetButton"), for: .normal)
        self.addSubview(addPetButton)
        
        // StackView dos Pets (Quando um pet for adicionado, ele deve ser adicionado na view dentro dessa stackview. Tem que dar um jeito de scrollar ela também)
        petsStackView.addArrangedSubview(addPetButton)
        petsStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(petsStackView)
        
        // Configuração do datePicker
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.locale = .autoupdatingCurrent
        datePicker.datePickerMode = .dateAndTime // Altere para .time ou .dateAndTime conforme necessário
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = UIColor(named: "Yellow")
        datePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())
        self.addSubview(datePicker)
        
        
        // Configuração do TextField das anotações
        notesTF.translatesAutoresizingMaskIntoConstraints = false
        notesTF.placeholder = String(localized: "Type your annotations here")
        notesTF.textAlignment = .natural
        notesTF.borderStyle = .roundedRect
        notesTF.delegate = viewController
        notesTF.returnKeyType = .done
        self.addSubview(notesTF)
        
        // Configuração do botão de pronto
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.backgroundColor = UIColor(named: "Yellow")
        doneButton.setTitle(String(localized: "Done"), for: .normal)
        doneButton.titleLabel?.font = UIFont(name: "Animal-Bold", size: 24)
        doneButton.setTitleColor(UIColor.black, for: .normal)
        doneButton.layer.cornerRadius = 14
        self.addSubview(doneButton)
        
        
        if UIDevice.current.userInterfaceIdiom == .phone{
            NSLayoutConstraint.activate([
                
                // Constraints do botão de fechar modal
                closeModalButton.widthAnchor.constraint(equalToConstant: 20),
                closeModalButton.heightAnchor.constraint(equalToConstant: 22),
                closeModalButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 28),
                closeModalButton.centerYAnchor.constraint(equalTo: viewTitle.centerYAnchor),
                
                // Constraints do título da view
                viewTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                viewTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                viewTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                viewTitle.heightAnchor.constraint(equalToConstant: 74),
                
                // Constraints da Label "Tarefa"
                tarefaLabel.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 60),
                tarefaLabel.leadingAnchor.constraint(equalTo: iconPicker.leadingAnchor),
                
                // Constraints da StackView do iconPicker e do taskTitleTF e seus elementos
                iconPicker.widthAnchor.constraint(equalToConstant: 54),
                iconPicker.heightAnchor.constraint(equalToConstant: 50),
                
                taskTitleTF.widthAnchor.constraint(equalToConstant: 265),
                
                iPtTStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                iPtTStackView.topAnchor.constraint(equalTo: tarefaLabel.bottomAnchor, constant: 10),
                
                // Constraints da Label "Pets"
                petsLabel.topAnchor.constraint(equalTo: iPtTStackView.bottomAnchor, constant: 16),
                petsLabel.leadingAnchor.constraint(equalTo: tarefaLabel.leadingAnchor),
                
                // Constraints da Stackview dos pets
                petsStackView.leadingAnchor.constraint(equalTo: petsLabel.leadingAnchor),
                petsStackView.topAnchor.constraint(equalTo: petsLabel.bottomAnchor, constant: 10),
                
                // Constraints do datePicker
                datePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                datePicker.topAnchor.constraint(equalTo: petsStackView.bottomAnchor, constant: 64),
                
                // Constraints do TextField das anotações
                notesTF.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                notesTF.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 64),
                notesTF.widthAnchor.constraint(equalToConstant: 336),
                notesTF.heightAnchor.constraint(equalToConstant: 80),
                
                // Constraints do botão de pronto
                doneButton.widthAnchor.constraint(equalToConstant: 228),
                doneButton.heightAnchor.constraint(equalToConstant: 60),
                doneButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                doneButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
                
            ])
        } else {
            NSLayoutConstraint.activate([
                // Constraints do botão de fechar modal
                closeModalButton.widthAnchor.constraint(equalToConstant: 20),
                closeModalButton.heightAnchor.constraint(equalToConstant: 22),
                closeModalButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 28),
                closeModalButton.centerYAnchor.constraint(equalTo: viewTitle.centerYAnchor),
                
                // Constraints do título da view
                viewTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                viewTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                viewTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                viewTitle.heightAnchor.constraint(equalToConstant: 74),
                
                // Constraints da Label "Tarefa"
                tarefaLabel.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 36.89),
                tarefaLabel.leadingAnchor.constraint(equalTo: iconPicker.leadingAnchor),
                
                // Constraints da StackView do iconPicker e do taskTitleTF e seus elementos
                iconPicker.widthAnchor.constraint(equalToConstant: 54),
                iconPicker.heightAnchor.constraint(equalToConstant: 50),
                
                taskTitleTF.widthAnchor.constraint(equalToConstant: 265),
                
                iPtTStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                iPtTStackView.topAnchor.constraint(equalTo: tarefaLabel.bottomAnchor, constant: 10),
                
                // Constraints da Label "Pets"
                petsLabel.topAnchor.constraint(equalTo: iPtTStackView.bottomAnchor, constant: 16),
                petsLabel.leadingAnchor.constraint(equalTo: tarefaLabel.leadingAnchor),
                
                // Constraints da Stackview dos pets
                petsStackView.leadingAnchor.constraint(equalTo: petsLabel.leadingAnchor),
                petsStackView.topAnchor.constraint(equalTo: petsLabel.bottomAnchor, constant: 10),
                
                // Constraints do datePicker
                datePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                datePicker.topAnchor.constraint(equalTo: petsStackView.bottomAnchor, constant: 64),
                
                // Constraints do TextField das anotações
                notesTF.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                notesTF.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 64),
                notesTF.widthAnchor.constraint(equalToConstant: 336),
                notesTF.heightAnchor.constraint(equalToConstant: 80),
                
                // Constraints do botão de pronto
                doneButton.widthAnchor.constraint(equalToConstant: 228),
                doneButton.heightAnchor.constraint(equalToConstant: 60),
                doneButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                doneButton.topAnchor.constraint(equalTo: notesTF.bottomAnchor, constant: 40)
            ])
        }
    }
    
    
    
}
