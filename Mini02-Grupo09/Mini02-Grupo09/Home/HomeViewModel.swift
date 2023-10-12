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
    weak var daySelector: DaySelector?
    let tasksManager = TasksManager.shared
    
    // Função que chama a célula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var taskIndices: [Int] = []
        for (index, task) in tasksManager.tasks.enumerated() {
            if Calendar.current.isDate(task.date!, inSameDayAs: viewController?.newView?.dayHeaderView.daySelectorController.daySelector.selectedDate ?? Date()) {
                taskIndices.append(index)
            }
        }
        
        if indexPath.row < taskIndices.count {
            let task = tasksManager.tasks[taskIndices[indexPath.row]]
            let cell = CustomTaskCell(style: .default, reuseIdentifier: "CustomTaskCell", task: task)
            return cell
        } else {
            // Crie uma célula vazia para casos em que não há tarefas nesta data
            return UITableViewCell()
        }
    }
    
    // Função para quando uma célula é selecionada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let celula = tableView.cellForRow(at: indexPath) as? CustomTaskCell {
            let vc = EditTaskModalViewController(task: tasksManager.tasks[indexPath.row], homeViewController: self.viewController ?? HomeViewController())
            
            let navVC = UINavigationController(rootViewController: vc)
            navVC.setNavigationBarHidden(true, animated: false)
            
            if let sheet = navVC.sheetPresentationController {
                sheet.preferredCornerRadius = 12
                sheet.detents = [.custom(resolver: { context in
                    226
                })]
            }
            tableView.deselectRow(at: indexPath, animated: true)
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
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showCreditsView(){
        let vc = CreditsViewController()
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
