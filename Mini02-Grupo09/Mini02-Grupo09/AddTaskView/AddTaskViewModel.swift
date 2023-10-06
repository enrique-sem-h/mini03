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
    
    let tasksManager = TasksManager()
    
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
        let vc = addPetToTaskModalViewController()
        
        let navVC = UINavigationController(rootViewController: vc)
        navVC.setNavigationBarHidden(true, animated: false)
        
        if let sheet = navVC.sheetPresentationController {
            sheet.preferredCornerRadius = 12
            sheet.detents = [.large()]
        }
        viewController?.present(navVC, animated: true)
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
