//
//  EditTaskModalViewController.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 27/09/23.
//

import Foundation
import UIKit

class EditTaskModalViewController: UIViewController {
    
    let newView = EditTaskModalView()
    let viewModel = EditTaskModalViewModel()
    
    // Esse init vai receber as informações da view anterior e passar para a modal
    init(hour: String, title: String) {
        newView.titleLabel.text = title
        newView.hourLabel.text = hour
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuração da view
        newView.frame = view.frame
        self.view = newView
        newView.setup()
        
        self.viewModel.viewController = self
        

        // Configuração dos botões da view
        newView.editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        
        newView.deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)

        newView.closeModalButton.addTarget(self, action: #selector(closeModalButtonTapped), for: .touchUpInside)

    }
    
    @objc func editButtonTapped() {
        viewModel.editTask()
    }
    
    @objc func deleteButtonTapped() {
        viewModel.deleteTask()
    }
    
    @objc func closeModalButtonTapped() {
        viewModel.closeModal()

    }
}
