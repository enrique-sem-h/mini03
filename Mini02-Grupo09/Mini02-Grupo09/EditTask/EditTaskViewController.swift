//
//  AddTaskViewController.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 29/09/23.
//

import Foundation
import UIKit

class EditTaskViewController: UIViewController {
    let newView = EditTaskView() // configuring view for display
    let viewModel = EditTaskViewModel() // calling an instance of the view model
    var task: DogTask // calling the task to be edited
    
    init(task: DogTask) { // initializing the task
        self.task = task
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad() // calling superview func
        
        self.viewModel.viewController = self // assigning self as the view model's view controller
    
        // View settings
        newView.frame = view.frame
        self.view = newView
        newView.setup()
        editSetup()
        
        // View button settings
        newView.closeModalButton.addTarget(self, action: #selector(closeModalButtonTapped), for: .touchUpInside)
        
        newView.iconPicker.addTarget(self, action: #selector(iconPickerTapped), for: .touchUpInside)
        
        newView.addPetButton.addTarget(self, action: #selector(addPetButtonTapped), for: .touchUpInside)
        
        newView.doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
    }
    
    @objc func closeModalButtonTapped() {
        viewModel.closeModal()
    }
    
    @objc func iconPickerTapped() {
        viewModel.chooseIcon()
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
        
//        viewModel.editTask(icon: newView.iconPicker.image(for: .normal), title: newView.taskTitleTF.text, dogs: nil, date: newView.datePicker.date, frequency: TasksManager.Frequency(rawValue: frequencyRV), notes: newView.notesTF.text)
    }
    
    func errorAlert (){
        let alert = UIAlertController(title: String(localized: "Oops! A Paw-sible Mishap 🐾"), message: String(localized: "It seems there was a little error while editing your task. Please check all the fields, and give it another 'bark'!"), preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        self.present(alert, animated: true)
        HapticsManager.shared.vibrate(for: .warning)
    }
    
    func editSetup(){
        var index: Int{
            get{
                for i in 0..<viewModel.tasksManager.fetchEnum.count{
                    if task.frequency == viewModel.tasksManager.fetchEnum[i]{
                        return i
                    }
                }
                return 0
            }
        }
        
        newView.taskTitleTF.delegate = self
        newView.taskTitleTF.text = task.title
        
        newView.datePicker.date = task.date!
        
        newView.frequencyPicker.selectedSegmentIndex = index
        
        newView.notesTF.delegate = self
        newView.notesTF.text = task.notes
    }
}

extension EditTaskViewController: UITextFieldDelegate, UITextViewDelegate {
    
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
