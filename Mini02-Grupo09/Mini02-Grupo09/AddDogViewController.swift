//
//  AddDogView.swift
//  UIKit2
//
//  Created by Enrique Carvalho on 26/09/23.
//

import Foundation
import UIKit
import PhotosUI

class AddDogViewController: UIViewController{
    
    var newView = AddDogView() // defining view
    
    private let viewModel = AddDogViewModel(dogManager: DogManager()) // creating a viewModel
    
    override func viewDidLoad() { // default viewDidLoad func
        super.viewDidLoad()
        voiceOverSetup()
        
        viewModel.controller = self
        
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
        viewModel.addDog(image: newView.imgButton.image!, name: newView.nameTF.text, age: newView.ageTF.text ?? "", weight: newView.weightTF.text ?? "", size: newView.sizeTF.text ?? "", viewController: self)
    }
    
    @objc func imgButtonFunc(){ // presenting the image picker
        present(newView.imagePicker, animated: true)
    }
        
    @objc func doneButtonTap(){ // handling the done toolbar button action
        viewModel.firstResponderHandler(nameTF: newView.nameTF, ageTF: newView.ageTF, sizeTF: newView.sizeTF, weightTF: newView.weightTF, agePicker: newView.agePicker) // viewModel func
    }
    
    func errorAlert (){
        let alert = UIAlertController(title: "Something Happened", message: "There was an error adding your dog, please verify all fields and try again", preferredStyle: .alert)
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
    
}

// MARK: making the view controller conform to protocols

extension AddDogViewController: UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{ // extending the view so it conforms to a few protocols
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // returning the num. of components for every picker (only used for size picker)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5 // returning the num. of rows for the main picker component (only used for size picker)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.dogManager.fetchEnum[row].localized // returning each text for picker rows (only used for size picker)
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        newView.sizeTF.text = viewModel.dogManager.fetchEnum[row].rawValue // binding picker's component to the text field
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        newView.imgButton.image = info[.originalImage] as? UIImage // setting the image to the image button
        dismiss(animated: true) // dismissing image picker
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
