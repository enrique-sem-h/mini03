//
//  EditTaskModalViewModel.swift
//  testeLista
//
//  Created by Gabriel Eduardo on 27/09/23.
//

import Foundation
import UIKit

class EditTaskModalViewModel {
    weak var viewController: EditTaskModalViewController?
    
    func editTask() {
        // Implementação da edição da task
    }
    
    func deleteTask() {
        // Implementação da deleção da task
    }
    
    func closeModal() {
        self.viewController?.dismiss(animated: true)
    }
}
