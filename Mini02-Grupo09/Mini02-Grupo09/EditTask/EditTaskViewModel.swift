//
//  AddTaskViewModel.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 29/09/23.
//

import Foundation
import UIKit

class EditTaskViewModel {
    weak var viewController: EditTaskViewController?
    
    let tasksManager = TasksManager.shared
    
    func chooseIcon() {
        print("Escolhendo icone")
        // Implementar função de escolher icone
    }
    
    func choosePet() {
        print("Escolhendo o pet")
        // Implementar função de escolher pet
    }
    
    func editTask(icon: UIImage?, title: String?, dogs: NSSet, date: Date?, frequency: TasksManager.Frequency?, notes: String?) {
        if let task = viewController?.task, let icon = icon, let title = title, let date = date, let frequency = frequency{
            tasksManager.edit(dogTask: task, title: title, icon: icon, dogs: dogs, date: date, frequency: frequency, notes: notes)
            self.viewController?.dismiss(animated: true) // going back to previous view
        } else {
            viewController?.errorAlert()
        }
    }
    
    func firstResponderHandler(control: UIControl) { // handling first responder function for view controller
        if control.isFirstResponder{
            control.resignFirstResponder()
        }
    }
    
    func closeModal() {
        self.viewController?.dismiss(animated: true)
    }
}
