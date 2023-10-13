//
//  EditTaskModalViewModel.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 27/09/23.
//

import Foundation
import UIKit

class EditTaskModalViewModel {
    let tasksManager = TasksManager.shared
    weak var viewController: EditTaskModalViewController?
    weak var homeViewController: HomeViewController?
    
    init(){
        
    }
    
    func editTask() {
        let vc = AddTaskViewController(with: viewController?.task)
        vc.tableViewToReload = homeViewController?.newView?.tasksTableView
        viewController?.dismiss(animated: true)
        
        // Update navigation bar appearance for the HomeViewController
           if let homeNavController = homeViewController?.navigationController {
//               homeNavController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "Red")!]
//               homeNavController.navigationBar.barTintColor = .white // Set the background color if needed
//               
//               // If you want to set the tab bar tint color:
//               if let tabBarController = homeNavController.tabBarController {
//                   tabBarController.tabBar.tintColor = UIColor(named: "Red")
//               }
//               homeNavController.isNavigationBarHidden = true
               homeNavController.pushViewController(vc, animated: true)
           }
        
    }
    
    func deleteTask() {
        let alert = UIAlertController(title: "Deleting task", message: String(localized: "Are you sure you want to delete this task?"), preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Delete", style: .destructive) { _ in
            if let task = self.viewController?.task{
                self.tasksManager.delete(task: task)
            }
            self.homeViewController?.newView?.tasksTableView.reloadData()
            self.viewController?.dismiss(animated: true)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(delete)
        alert.addAction(cancel)
        self.viewController?.present(alert, animated: true)
    }
    
    func closeModal() {
        self.viewController?.dismiss(animated: true)
    }
}
