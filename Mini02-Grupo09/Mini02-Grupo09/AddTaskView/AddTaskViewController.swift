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
        
        newView.iconPicker.addTarget(self, action: #selector(iconPickerTapped), for: .touchUpInside)
        
        newView.addPetButton.addTarget(self, action: #selector(addPetButtonTapped), for: .touchUpInside)
        
        newView.doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
    }
    
    @objc func closeModalButtonTapped() {
        viewModel.closeModal()
    }
    
    @objc func iconPickerTapped() {
        viewModel.chooseIcon(iconPickerRoot: newView.iconPicker)
    }
    
    @objc func addPetButtonTapped() {
        viewModel.choosePet()
    }
    
    @objc func doneButtonTapped() {
        var frequencyRV = ""
        let index = newView.frequencyPicker.selectedSegmentIndex
        if index <= 4 && index >= 0{
            frequencyRV = newView.frequencyPicker.titleForSegment(at: index)!
        } else {
            errorAlert()
            return
        }
        
        viewModel.addTask(icon: newView.iconPicker.iconView.image, title: newView.taskTitleTF.text, dogs: nil, date: newView.datePicker.date, frequency: TasksManager.Frequency(rawValue: frequencyRV), notes: newView.notesTF.text)
    }
    
    func errorAlert (){
        let alert = UIAlertController(title: "Something Happened", message: "There was an error adding your dog, please verify all fields and try again", preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

extension AddTaskViewController: UITextFieldDelegate, UITextViewDelegate {
    
    // Essa função faz o teclado dar dismiss ao apertar a tecla return no TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    // Essa função limita a quantidade de caracteres de um TextField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == newView.taskTitleTF {
            if let text = textField.text, let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                return updatedText.count <= 27
            }
        }
        return true
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
