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
    weak var view: AddTaskView?
    
    let tasksManager = TasksManager.shared
    
   
    
    func chooseIcon(iconPickerRoot: IconPicker) {
        let vc = iconPickerModalViewController(iconPickerRoot: iconPickerRoot)
        
        let navVC = UINavigationController(rootViewController: vc)
        navVC.setNavigationBarHidden(true, animated: false)
        
        if let sheet = navVC.sheetPresentationController {
            sheet.preferredCornerRadius = 12
            sheet.detents = [.custom(resolver: { context in
                262
            })]
        }
        viewController?.present(navVC, animated: true)
    }
    
    func choosePet() {
        let vc = addPetToTaskModalViewController(superViewController: viewController)
        
        let navVC = UINavigationController(rootViewController: vc)
        navVC.setNavigationBarHidden(true, animated: false)
        
        if let sheet = navVC.sheetPresentationController {
            sheet.preferredCornerRadius = 12
            sheet.detents = [.large()]
        }
        viewController?.present(navVC, animated: true)
    }
    
    func addTask(icon: UIImage?, title: String?, dogs: NSSet?, date: Date?, frequency: TasksManager.Frequency?, notes: String?) { // adding task to core data database func
        if let icon = icon, let title = title, let dogs = dogs, let date = date, let frequency = frequency{ // safe unwrapping all parameters for the add func
            if dogs != NSSet(array: []) && title != ""{ // making sure dogs and task name are not empty
                tasksManager.newTask(title: title, icon: icon, dogs: dogs, date: date, frequency: frequency, notes: notes) // saving task to database
                self.viewController?.dismiss(animated: true) // going back to previous view
            } else {
                viewController?.errorAlert() // displaying error alert
            }
        }
    }
    
    func firstResponderHandler() { // handling first responder function for view controller
    }
    
    func closeModal() {
        self.viewController?.dismiss(animated: true)
    }
}
