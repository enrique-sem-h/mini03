//
//  AddTaskViewController.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 29/09/23.
//

import Foundation
import UIKit

class AddTaskViewController: UIViewController {
    var task: DogTask?
    let newView = AddTaskView()
    private let viewModel = AddTaskViewModel()
    weak var viewControllerpai: HomeViewController?
    weak var tableViewToReload: UITableView?
    
    var dogsArray: [Dog] = []
    
    init(){
        super.init(nibName: nil, bundle: nil)
        newView.viewTitle.text = String(localized: "New Task")
    }
    
    init(with task: DogTask?) {
        super.init(nibName: nil, bundle: nil)
        self.task = task
        if let task = task{
            newView.viewTitle.text = String(localized: "Edit Task")
            newView.iconPicker.iconView.image = UIImage(data: task.icon!)
            newView.taskTitleTF.text = task.title
            
            task.dogs?.forEach({ dog in
                var count = 0
                if let dog = dog as? Dog{
                    let pet: UIImageView = {
                        let pet = UIImageView()
                        pet.image = UIImage(data: dog.image!)
                        pet.translatesAutoresizingMaskIntoConstraints = false
                        pet.contentMode = .scaleAspectFill // scale mode
                        pet.layer.cornerRadius = 24 // 48 (Tamanho do círculo) / 2
                        pet.clipsToBounds = true
                        NSLayoutConstraint.activate([
                            pet.widthAnchor.constraint(equalToConstant: 48),
                            pet.heightAnchor.constraint(equalToConstant: 48)])
                        return pet
                    }()
                    newView.petsStackView.insertArrangedSubview(pet, at: count)
                }
                count += 1
            })
            
            newView.datePicker.date = task.date!
            newView.notesTF.text = task.notes
            
            newView.closeModalButton.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
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
        if task == nil{
            viewModel.addTask(icon: newView.iconPicker.iconView.image, title: newView.taskTitleTF.text, dogs: NSSet(array: dogsArray), date: newView.datePicker.date, notes: newView.notesTF.text)
        } else {
            viewModel.editTask(icon: newView.iconPicker.iconView.image, title: newView.taskTitleTF.text, dogs: NSSet(array: dogsArray), date: newView.datePicker.date, notes: newView.notesTF.text)
        }
        viewControllerpai?.newView?.tasksTableView.reloadData()
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
