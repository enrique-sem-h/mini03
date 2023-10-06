//
//  EditViewController.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 06/10/23.
//

import Foundation
import UIKit

class EditDogViewController: UIViewController {
    
    var newView = EditDogView() // defining view
    var dog: Dog
    
    private let viewModel = EditDogViewModel() // creating a viewModel
    
    init(dog: Dog) {
        self.dog = dog // initializing CD manager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() { // default viewDidLoad func
        super.viewDidLoad()
        viewModel.controller = self
        
        voiceOverSetup()
        
        editSetup()
        
        newView.frame = self.view.frame
        
        self.view = newView // changing the view controller's view
        
        newView.button.addTarget(self, action: #selector(buttonFunc), for: .touchDown) // attaching target to button in this view controller
        newView.ageTF.inputAccessoryView = createToolbar() // creating the done button
        newView.sizeTF.inputAccessoryView = createToolbar() // creating the done toolbar
        newView.weightTF.inputAccessoryView = createToolbar() // reating done btn
        
        tapGesture() // calling the tap gesture function when loading the view
        
        newView.createDelegate(delegate: self) // calling the create delegate function that is declared in the view
    }
    
    // MARK: beginning of function declarations
    
    @objc func buttonFunc() { // defining the submit button (add button) func
        viewModel.editDog(image: newView.imgButton.image!, name: newView.nameTF.text, age: newView.ageTF.text ?? "", weight: newView.weightTF.text ?? "", size: newView.sizeTF.text ?? "", viewController: self)
    }
    
    @objc func imgButtonFunc(){ // presenting the image picker
        present(newView.imagePicker, animated: true)
    }
        
    @objc func doneButtonTap(){ // handling the done toolbar button action
        viewModel.firstResponderHandler(nameTF: newView.nameTF, ageTF: newView.ageTF, sizeTF: newView.sizeTF, weightTF: newView.weightTF, agePicker: newView.agePicker) // viewModel func
    }
    
    func errorAlert (){
        let alert = UIAlertController(title: String(localized: "Oops! A Paw-sible Mishap 🐾"), message: String(localized: "It seems there was a little error while adding your new friend. Please 'paws' for a moment, and try again!"), preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func tapGesture(){ // defining tap gesture for image
        let tap = UITapGestureRecognizer(target: self, action: #selector(imgButtonFunc)) // creating the recognizer
        newView.imgButton.isUserInteractionEnabled = true // enabling image's interction
        HapticsManager.shared.selectionVibrate() // creating vibration
        newView.imgButton.addGestureRecognizer(tap) // binding tap gesture to the image
    }
    
    func createToolbar() -> UIToolbar{ // creating the done toolbar for pickers and keyboard
        let toolbar = UIToolbar() // defining toolbar
        toolbar.sizeToFit() // resizing it
        
        //done btn
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        toolbar.setItems([done], animated: true) // binding done button to toolbar
        
        return toolbar // returning the toolbar (duh)
    }
    
    func voiceOverSetup(){
        newView.title.isAccessibilityElement = true
        newView.title.accessibilityTraits = .header
        
        newView.imgButton.isAccessibilityElement = true
        newView.imgButton.accessibilityTraits = .button
        newView.imgButton.accessibilityHint = "click to add an image"
        
        newView.ageTF.isAccessibilityElement = true
        newView.ageTF.accessibilityLabel = "date picker"
        newView.ageTF.accessibilityHint = "double-tap to select a date"
        newView.ageTF.accessibilityTraits = .none
        
        newView.agePicker.isAccessibilityElement = true
        newView.agePicker.accessibilityLabel = "date picker"
        newView.agePicker.accessibilityTraits = .none
        
        newView.sizeTF.isAccessibilityElement = true
        newView.sizeTF.accessibilityLabel = "size picker"
        newView.sizeTF.accessibilityHint = "double-tap to select a size"
        newView.sizeTF.accessibilityTraits = .none
        
    }
    
    func editSetup(){
        newView.imgButton.image = UIImage(data: dog.image)
        newView.nameTF.text = dog.name
        newView.ageTF.text = "\(dog.age)"
        newView.sizeTF.text = dog.size
        newView.weightTF.text = "\(dog.weight)"
        
    }
}