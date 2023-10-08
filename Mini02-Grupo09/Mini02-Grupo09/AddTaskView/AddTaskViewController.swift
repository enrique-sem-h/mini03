//
//  AddTaskViewController.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 29/09/23.
//

import Foundation
import UIKit

class AddTaskViewController: UIViewController {
    weak var viewControllerpai: HomeViewController?
    let newView = AddTaskView()
    let viewModel = AddTaskViewModel()
    
    var dogsArray: [Dog] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        voiceOverSetup()
        
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
        var frequencyRV = "" // creating a string variable to make things easier
        let index = newView.frequencyPicker.selectedSegmentIndex // retrieving index from segmented control
        if index <= 4 && index >= 0{ // making sure the segmented control was selected
            frequencyRV = newView.frequencyPicker.titleForSegment(at: index)! // retrieving the seg control option
        } else {
            errorAlert() // displaying error alert
            return // returning
        }
        
        viewModel.addTask(icon: newView.iconPicker.iconView.image, title: newView.taskTitleTF.text, dogs: NSSet(array: dogsArray), date: newView.datePicker.date, frequency: TasksManager.Frequency(rawValue: frequencyRV), notes: newView.notesTF.text)
        viewControllerpai?.newView.tasksTableView.reloadData()
    }
    
    func errorAlert (){
        let alert = UIAlertController(title: String(localized: "Oops! A Paw-sible Mishap 🐾"), message: String(localized: "It seems there was a little error while adding your task. Please check all the fields, and give it another 'bark'!"), preferredStyle: .alert) // defining an error alert
        alert.addAction(.init(title: "OK", style: .default)) // defining an ok button to dismiss the alert
        self.present(alert, animated: true) // presenting it
        HapticsManager.shared.vibrate(for: .warning) // triggering a warning haptic
    }
    
    func voiceOverSetup(){
        newView.viewTitle.isAccessibilityElement = true
        newView.viewTitle.accessibilityTraits = .header
        newView.viewTitle.accessibilityHint = "header"
        
        newView.iconPicker.isAccessibilityElement = true
        newView.iconPicker.accessibilityHint = "click to select task icon"
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
