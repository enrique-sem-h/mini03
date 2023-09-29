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
    
    var newView: AddDogView?
    
    private let viewModel = AddDogViewModel(dogManager: DogManager()) // creating a viewModel
    
    override func viewDidLoad() { // default viewDidLoad func
        super.viewDidLoad()
        
        newView = AddDogView(frame: self.view.frame)
        guard let newView = newView else {
            return
        }
        
        self.view = newView
        
        newView.button.addTarget(self, action: #selector(buttonFunc), for: .touchDown)
        newView.ageTF.inputAccessoryView = createToolbar() // creating the done button
        newView.sizeTF.inputAccessoryView = createToolbar() // creating the done toolbar
        newView.weightTF.inputAccessoryView = createToolbar() // reating done btn
        
        tapGesture()
        
        newView.createDelegate(delegate: self)
    }
    
    @objc func buttonFunc() { // defining the submit button (add button) func
        guard let newView = newView else {
            return
        }
        viewModel.addDog(image: newView.imgButton.image, name: newView.nameTF.text, age: newView.ageTF.text ?? "", weight: newView.weightTF.text ?? "", size: newView.sizeTF.text ?? "")
        dismiss(animated: true) // going back to previous view
    }
    
    @objc func imgButtonFunc(){ // presenting the image picker
        guard let newView = newView else {
            return
        }
        present(newView.imagePicker, animated: true)
    }
        
    @objc func doneButtonTap(){ // handling the done toolbar button action
        guard let newView = newView else {
            return
        }
        viewModel.firstResponderHandler(nameTF: newView.nameTF, ageTF: newView.ageTF, sizeTF: newView.sizeTF, weightTF: newView.weightTF, agePicker: newView.agePicker) // viewModel func
    }
    
    func tapGesture(){ // defining tap gesture for image
        let tap = UITapGestureRecognizer(target: self, action: #selector(imgButtonFunc)) // creating the recognizer
        newView?.imgButton.isUserInteractionEnabled = true // enabling image's interction
        newView?.imgButton.addGestureRecognizer(tap) // binding tap gesture to the image
    }
    
    func createToolbar() -> UIToolbar{ // creating the done toolbar for pickers and keyboard
        let toolbar = UIToolbar() // defining toolbar
        toolbar.sizeToFit() // resizing it
        
        //done btn
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        toolbar.setItems([done], animated: true) // binding done button to toolbar
        
        return toolbar // returning the toolbar (duh)
    }
    
}

extension AddDogViewController: UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{ // extending the view so it conforms to a few protocols
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // returning the num. of components for every picker (only used for size picker)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5 // returning the num. of rows for the main picker component (only used for size picker)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.dogManager.fetchEnum[row].rawValue // returning each text for picker rows (only used for size picker)
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        newView?.sizeTF.text = viewModel.dogManager.fetchEnum[row].rawValue // binding picker's component to the text field
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        newView?.imgButton.image = info[.originalImage] as? UIImage // setting the image to the image button
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