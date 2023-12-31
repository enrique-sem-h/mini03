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
        
       if let homeNavController = homeViewController?.navigationController {
           homeNavController.pushViewController(vc, animated: true)
       }
        
    }
    
    func deleteTask() {
        if UIDevice.current.userInterfaceIdiom == .phone{
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
        } else {
            let alert = UIAlertController(title: "Deleting task", message: String(localized: "Are you sure you want to delete this task?"), preferredStyle: .alert)
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
    }
    
    func closeModal() {
        self.viewController?.dismiss(animated: true)
    }
}
