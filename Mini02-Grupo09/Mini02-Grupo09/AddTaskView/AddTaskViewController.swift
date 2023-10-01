//
//  AddTaskViewController.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 29/09/23.
//

import Foundation
import UIKit

class AddTaskViewController: UIViewController {
    let newView = AddTaskView()
    let viewModel = AddTaskViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.viewController = self
    
        // Configuração da view
        newView.frame = view.frame
        self.view = newView
        newView.setup()
        
        newView.taskTitleTF.delegate = self
        newView.notesTF.delegate = self
        
        // Configuração dos botões da view
        newView.closeModalButton.addTarget(self, action: #selector(closeModalButtonTapped), for: .touchUpInside)
    }
    
    @objc func closeModalButtonTapped() {
        viewModel.closeModal()
    }
}

extension AddTaskViewController: UITextFieldDelegate, UITextViewDelegate {
    
    // Essa função faz o teclado dar dismiss ao apertar a tecla return no TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

extension UITextField {
    func addBottomBorderWithColor(color: UIColor) {
        self.borderStyle = .none
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(border)
    }
}
