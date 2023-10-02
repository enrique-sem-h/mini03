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
    
    let tasksManager = TasksManager()
    
    func chooseIcon() {
        print("Escolhendo icone")
        // Implementar função de escolher icone
    }
    
    func choosePet() {
        print("Escolhendo o pet")
        // Implementar função de escolher pet
    }
    
    func addTask(icon: UIImage?, title: String?, dogs: NSSet?, date: Date?, frequency: TasksManager.Frequency?, notes: String?) {
        if let icon = icon, let title = title, let dogs = dogs, let date = date, let frequency = frequency{
            tasksManager.newTask(title: title, icon: icon, dogs: dogs, date: date, frequency: frequency, notes: notes)
            self.viewController?.dismiss(animated: true) // going back to previous view
        } else {
            viewController?.errorAlert()
        }
    }
    
    func firstResponderHandler() { // handling first responder function for view controller
    }
    
    func closeModal() {
        self.viewController?.dismiss(animated: true)
    }
}
