//
//  AddTaskViewModel.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 29/09/23.
//

import Foundation
import UIKit

class AddTaskViewModel {
    weak var viewController: AddTaskViewController?
    
//    let tasksManager: TasksManager
//    
//    init(tasksManager: TasksManager) {
//        self.tasksManager = tasksManager // initializing CD manager
//    }
    
    func chooseIcon() {
        print("Escolhendo icone")
        // Implementar função de escolher icone
    }
    
    func choosePet() {
        print("Escolhendo o pet")
        // Implementar função de escolher pet
    }
    
    func addTask() {
        print("Tarefa adicionada")
        self.viewController?.dismiss(animated: true) // going back to previous view
    }
    
    func firstResponderHandler() { // handling first responder function for view controller
    }
    
    func closeModal() {
        self.viewController?.dismiss(animated: true)
    }
}
