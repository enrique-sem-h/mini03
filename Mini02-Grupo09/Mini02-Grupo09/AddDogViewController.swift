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
    
    var dog: Dog?
    var newView = AddDogView() // defining view
    private let viewModel = AddDogViewModel() // creating a viewModel
    weak var listViewController: ListViewController?
    
    init(){
        self.dog = nil
        super.init(nibName: nil, bundle: nil)
    }
    
    init(with dog: Dog?) {
        super.init(nibName: nil, bundle: nil)
        self.dog = dog
        if let dog = dog{
            newView.title.text = "Edit Dog"
            newView.imgButton.image = UIImage(data: dog.image!)
            newView.nameTF.text = dog.name
            newView.ageTF.text = "\(dog.age)"
            newView.sizeTF.text = dog.size
            newView.weightTF.text = "\(dog.weight)"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() { // default viewDidLoad func
        super.viewDidLoad()
        voiceOverSetup()
        
        viewModel.controller = self
        
        newView.frame = self.view.frame
        
        self.view = newView // changing the view controller's view
        
        newView.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside) // adding target to go back button
        newView.button.addTarget(self, action: #selector(buttonFunc), for: .touchDown) // attaching target to button in this view controller
        newView.agePicker.addTarget(self, action: #selector(ageCalculator), for: .valueChanged) // adding target to apply changes on value change
        newView.ageTF.inputAccessoryView = createToolbar() // creating the done button
        newView.sizeTF.inputAccessoryView = createToolbar() // creating the done toolbar
        newView.weightTF.inputAccessoryView = createToolbar() // reating done btn
        
        tapGesture() // calling the tap gesture function when loading the view
        
        newView.createDelegate(delegate: self) // calling the create delegate function that is declared in the view
    }
    
    // MARK: beginning of function declarations
    
    @objc func buttonFunc() { // defining the submit button (add button) func
        if dog != nil{
            viewModel.editDog(image: newView.imgButton.image!, name: newView.nameTF.text, age: newView.ageTF.text ?? "", weight: newView.weightTF.text ?? "", size: newView.sizeTF.text ?? "", viewController: listViewController)
        } else {
            viewModel.addDog(image: newView.imgButton.image!, name: newView.nameTF.text, age: newView.ageTF.text ?? "", weight: newView.weightTF.text ?? "", size: newView.sizeTF.text ?? "", viewController: self)
        }
    }
    
    @objc func goBack(){
        viewModel.goBack() // calling the pop view func
    }
    
    @objc func ageCalculator(){
        let ageTF = newView.ageTF
        let agePicker = newView.agePicker
        
        let calendar = Calendar.current // defining calendar
        let currentDate = Date() // defining current date
        let selectedDate = agePicker.date // defining picked date
        
        let ageComponents = calendar.dateComponents([.year], from: selectedDate, to: currentDate) // returning the diference between the year picked and the current
        
        if let years = ageComponents.year { // safely unwrapping the year for age component
            ageTF.text = "\(years)" // attributing it to the textField
        } else {
            print("Invalid Date") // in case of failure to unwrap the year (probably won't happen)
        }
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // called when user press return on keyboard
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // called when clicking on screen
        if newView.sizeTF.isFirstResponder{
            viewModel.sizeReturner(newView.sizeTF)
        }
        view.endEditing(true)
    }
    
}
