//
//  HomeViewController.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 27/09/23.
//

import Foundation
import UIKit


class HomeViewController: UIViewController {
    
    var newView : HomeView?
    let viewModel = HomeViewModel()
    
    let tasksManager = TasksManager.shared
    
    var filteredTasks: [DogTask]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pawprint"), style: .plain, target: self, action: #selector(showListView))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(showCredits))
        
        // Configuração da view
        newView = HomeView(calendar: Calendar.current, viewController: self)
        guard let newView = newView else { fatalError() }
        
        newView.frame = self.view.frame
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
    
    @objc func showListView(){
        viewModel.showListView()
    }
    
    @objc func showCredits(){
        viewModel.showCreditsView()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var taskIndices: [Int] = []
        for (index, task) in tasksManager.tasks.enumerated() {
            if Calendar.current.isDate(task.date!, inSameDayAs: self.newView?.dayHeaderView.daySelectorController.daySelector.selectedDate ?? Date()) {
                taskIndices.append(index)
            }
        }
        return taskIndices.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.tableView(tableView, didSelectRowAt: indexPath)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0 // Altura desejada para a célula
    }
}

extension HomeViewController: DayViewStateUpdating {
    func move(from oldDate: Date, to newDate: Date) {
    }
}

