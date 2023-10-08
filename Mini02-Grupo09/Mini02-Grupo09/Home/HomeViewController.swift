//
//  HomeViewController.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 27/09/23.
//

import Foundation
import UIKit


class HomeViewController: UIViewController {
    
    let newView = HomeView()
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuração da view
        newView.frame = view.frame
        self.view = newView
        newView.setup()
        
        newView.tasksTableView.dataSource = self
        newView.tasksTableView.delegate = self
        
        self.viewModel.viewController = self
        
        // Configurando botõe da view
        newView.addTaskButton.addTarget(self, action: #selector(showAddTaskView), for: .touchUpInside)
        
        // configurando o titulo da navigation view
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = .gray
        
        title = "Tarefas"
    }
    
    @objc func showAddTaskView() {
        viewModel.showAddTaskView()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tasksManager = TasksManager.shared
        return tasksManager.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.tableView(tableView, didSelectRowAt: indexPath)
    }
}

