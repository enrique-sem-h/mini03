//
//  AddTaskView.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 29/09/23.
//

import Foundation
import UIKit

class AddTaskView: UIView {
    let taskTitleTF = UITextField()
    let iconPicker = UIImage()
    let addPetButton = UIButton()
    let datePicker = UIDatePicker()
    let frequencyPicker = UISegmentedControl(items: ["Once", "Daily", "Weekly", "Monthly", "Anually"])
    let notesTF = UITextField()
    
    weak var viewController: AddTaskViewController?
    
    func setup() {
        self.backgroundColor = .systemBackground
        
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
        notesTF.translatesAutoresizingMaskIntoConstraints = false
        notesTF.placeholder = "Digite suas anotações aqui"
        notesTF.textAlignment = .natural
        notesTF.borderStyle = .roundedRect
        notesTF.delegate = viewController
        notesTF.returnKeyType = .done
        self.addSubview(notesTF)
        
        
        NSLayoutConstraint.activate([
            
            notesTF.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            notesTF.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            notesTF.widthAnchor.constraint(equalToConstant: 336),
            notesTF.heightAnchor.constraint(equalToConstant: 80)
            
            
        ])
        
        
        
    }
}
