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
    let frequencyPicker = UISegmentedControl()
    let notesTF = UITextField()
    
    func setup() {
        self.backgroundColor = .systemBackground
        
        // Configuração do TextField do título
        taskTitleTF.translatesAutoresizingMaskIntoConstraints = false
        taskTitleTF.placeholder = "Digite algo aqui"
        taskTitleTF.frame = CGRect(x: 20, y: 100, width: 200, height: 30)
        taskTitleTF.borderStyle = .none
        taskTitleTF.addBottomBorderWithColor(color: .gray)
        self.addSubview(taskTitleTF)
        
        // Configuração do iconPicker
        
        // Configuração do Botão de adicionar pet
        
        // Configuração do datePicker
        
        
        
        NSLayoutConstraint.activate([
        ])
        
        
        
    }
}
