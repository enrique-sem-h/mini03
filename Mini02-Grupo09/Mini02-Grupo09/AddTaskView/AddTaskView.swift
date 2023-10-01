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
    
    let taskTitleTF = UITextField() // TextField do título da tarefa
    let iconPicker = UIImage() // Picker de ícones
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
        viewTitle.textAlignment = .center
        viewTitle.backgroundColor = .gray
        self.addSubview(viewTitle)
        
        // Configuração do TextField do título
//        taskTitleTF.translatesAutoresizingMaskIntoConstraints = false
//        taskTitleTF.placeholder = "Digite algo aqui"
//        taskTitleTF.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
//        taskTitleTF.addBottomBorderWithColor(color: .gray)
//        taskTitleTF.delegate = viewController
//        taskTitleTF.returnKeyType = .done
//        self.addSubview(taskTitleTF)
        
        // Configuração do iconPicker
        
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
            
            // Constraints do título da view
            viewTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewTitle.topAnchor.constraint(equalTo: self.topAnchor),
            viewTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewTitle.heightAnchor.constraint(equalToConstant: 74),
            
            // Constraints do TextField das anotações
            notesTF.widthAnchor.constraint(equalToConstant: 336),
            notesTF.heightAnchor.constraint(equalToConstant: 80)
            
            
        ])
        
        
        
    }
}
