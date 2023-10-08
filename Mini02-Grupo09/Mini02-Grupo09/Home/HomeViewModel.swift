//
//  HomeViewModel.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 27/09/23.
//

import Foundation
import UIKit

class HomeViewModel {
    weak var viewController: HomeViewController?
    
    // Função que chama a célula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tasksManager = TasksManager.shared
        let task = tasksManager.tasks[indexPath.row] // Definindo a task
        let cell = CustomTaskCell(style: .default, reuseIdentifier: "CustomTaskCell", date: task.date!, icon: task.icon!, taskTitle: task.title!)
        
        return cell
    }
    
    // Função para quando uma célula é selecionada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let celula = tableView.cellForRow(at: indexPath) as? CustomTaskCell {
            let vc = EditTaskModalViewController(hour: celula.hourLabel.text!, title: celula.titleLabel.text!)
            
            let navVC = UINavigationController(rootViewController: vc)
            navVC.setNavigationBarHidden(true, animated: false)
            
            if let sheet = navVC.sheetPresentationController {
                sheet.preferredCornerRadius = 12
                sheet.detents = [.custom(resolver: { context in
                    226
                })]
            }
            viewController?.present(navVC, animated: true)
        }
    }
    
    func showAddTaskView() {
        let vc = AddTaskViewController()
        vc.viewControllerpai = viewController
        
        let navVC = UINavigationController(rootViewController: vc)
        navVC.setNavigationBarHidden(true, animated: false)
        
        if let sheet = navVC.sheetPresentationController {
            sheet.preferredCornerRadius = 12
            sheet.detents = [.large()]
        }
        viewController?.present(navVC, animated: true)
    }
    
    func showListView(){
        let vc = ListViewController()
        
        let navVC = UINavigationController(rootViewController: vc)
        
        if let sheet = navVC.sheetPresentationController {
            sheet.preferredCornerRadius = 12
            sheet.detents = [.large()]
        }
        viewController?.present(navVC, animated: true)
    }
    
    func showCreditsView(){
        let vc = CreditsView()
        
        let navVC = UINavigationController(rootViewController: vc)
        
        if let sheet = navVC.sheetPresentationController {
            sheet.preferredCornerRadius = 12
            sheet.detents = [.large()]
        }
        viewController?.present(navVC, animated: true)
    }
}
