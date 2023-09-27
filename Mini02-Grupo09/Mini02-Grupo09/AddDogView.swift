//
//  AddDogView.swift
//  UIKit2
//
//  Created by Enrique Carvalho on 26/09/23.
//

import Foundation
import UIKit
import PhotosUI

class AddDogView: UIViewController{
    
    //setting all view components
    let stack = UIStackView()
    private let nameTF = UITextField()
    private let ageTF = UITextField()
    private let sizeTF = UITextField()
    private let weightTF = UITextField()
    private let imgButton = UIImageView()
    private let imagePicker = UIImagePickerController()
    private let agePicker = UIDatePicker()
    
    private let viewModel = AddDogViewModel(dogManager: DogManager()) // creating a viewModel
    
    override func viewDidLoad() { // default viewDidLoad func
        view.backgroundColor = .systemBackground // defining bg color to adapt to dark mode
        configureStack() // configuring the whole view
    }
    
    private func configureStack(){
        stack.axis = .vertical // setting it as a VStack
        stack.distribution = .fillEqually // defining its distribution
        stack.spacing = 10 // defining its spacing
        stack.translatesAutoresizingMaskIntoConstraints = false // disabling autoresizing mask translation
                
        imgButton.image = UIImage(named: "placeholder") // defining placeholder for img
        imgButton.contentMode = .scaleAspectFill // scale mode
        imgButton.layer.masksToBounds = false // disabling mask to bounds
        imgButton.clipsToBounds = true // enabling bound clipping
        imgButton.translatesAutoresizingMaskIntoConstraints = false // disabling autoresize mask to const.
        imgButton.layer.cornerRadius = 170 / 2 // rounding it (170 is its height and width constraints)
        tapGesture() // defining its tapGesture
        
        imagePicker.delegate = self // defining imagePicker's delegate
        imagePicker.allowsEditing = true // allowing the user to edit the image before inserting it
        imagePicker.sourceType = .camera // defining source type

        nameTF.placeholder = "Name" // name textfield's placeholder
        nameTF.delegate = self
        nameTF.borderStyle = .roundedRect // defining its borders
        nameTF.translatesAutoresizingMaskIntoConstraints = false // disabling autoresize mask to const.
        nameTF.returnKeyType = .done // defining keyboard return button
        nameTF.enablesReturnKeyAutomatically = true // dinamically enabling return btn.
        
        
        agePicker.datePickerMode = .date // defining datePicker
        agePicker.preferredDatePickerStyle = .wheels // setting its style
        agePicker.maximumDate = .now // limiting date
        ageTF.placeholder = "Age" // date textfield placeholder
        ageTF.inputView = agePicker // defining textfield's input mode to picker
        ageTF.inputAccessoryView = createToolbar() // creating the done button
        ageTF.borderStyle = .roundedRect // rounding textfield's border
        ageTF.translatesAutoresizingMaskIntoConstraints = false // disabling autoresizing mask translation
        
        let sizePicker = UIPickerView() // defining picker for the dog's size (enum)
        sizePicker.delegate = self // setting its delegate
        sizePicker.dataSource = self // setting its data source
        sizePicker.tag = 1 // tagging it
        sizeTF.placeholder = "Size" // size textfield's placeholder
        sizeTF.inputView = sizePicker // defining input to picker
        sizeTF.inputAccessoryView = createToolbar() // creating the done toolbar
        sizeTF.borderStyle = .roundedRect // rounding its borders
        sizeTF.translatesAutoresizingMaskIntoConstraints = false // disabling autoresizing mask translation
        
        weightTF.placeholder = "Weight" // weight textfield's placeholder
        weightTF.keyboardType = .decimalPad // setting its keyboard type
        weightTF.borderStyle = .roundedRect // rounding its borders
        weightTF.inputAccessoryView = createToolbar() // reating done btn
        weightTF.translatesAutoresizingMaskIntoConstraints = false // disabling autoresizing mask translation
                
        var button: UIButton{ // defining add button
            let button = UIButton() // creating the button
            button.configuration = .borderless() // defining its configs
            button.configuration?.title = "Add" // setting a text to it
            button.addTarget(self, action: #selector(buttonFunc), for: .touchDown) // adding a tap func
            return button // returnin it to the var
        }
        
        view.addSubview(imgButton) // adding the image as a subview
        stack.addArrangedSubview(nameTF) // adding the name textfield as a stack's arranged subview
        stack.addArrangedSubview(ageTF) // adding the age textfield as a stack's arranged subview
        stack.addArrangedSubview(sizeTF) // adding the size textfield as a stack's arranged subview
        stack.addArrangedSubview(weightTF) // adding the weight textfield as a stack's arranged subview
        stack.addArrangedSubview(button) // adding the submit button as a stack's arranged subview
        
        view.addSubview(stack) // adding the stack itself as a subview
        
        // Constraints for the stack view
        NSLayoutConstraint.activate([
            nameTF.heightAnchor.constraint(equalToConstant: 70), // configuring the textfields sizes
            
            imgButton.widthAnchor.constraint(equalToConstant: 170), // defining image's size
            imgButton.heightAnchor.constraint(equalToConstant: 170), // defining image's size
            
            imgButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // defining image's position
            imgButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0), // defining image's position
            
            stack.topAnchor.constraint(equalTo: imgButton.bottomAnchor, constant: 20), // setting stack's position
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30), // setting stack's position
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30), // setting stack's position
        ])
    }
    
    @objc func buttonFunc() { // defining the submit button (add button) func
        viewModel.addDog(image: imgButton.image, name: nameTF.text, age: ageTF.text ?? "", weight: weightTF.text ?? "", size: sizeTF.text ?? "")
        navigationController?.popViewController(animated: true) // going back to previous view
    }
    
    @objc func imgButtonFunc(){ // presenting the image picker
        present(imagePicker, animated: true)
    }
        
    @objc func doneButtonTap(){ // handling the done toolbar button action
        viewModel.firstResponderHandler(nameTF: nameTF, ageTF: ageTF, sizeTF: sizeTF, weightTF: weightTF, agePicker: agePicker) // viewModel func
    }
    
    func tapGesture(){ // defining tap gesture for image
        let tap = UITapGestureRecognizer(target: self, action: #selector(imgButtonFunc)) // creating the recognizer
        imgButton.isUserInteractionEnabled = true // enabling image's interction
        imgButton.addGestureRecognizer(tap) // binding tap gesture to the image
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

extension AddDogView: UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{ // extending the view so it conforms to a few protocols
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
        sizeTF.text = viewModel.dogManager.fetchEnum[row].rawValue // binding picker's component to the text field
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imgButton.image = info[.originalImage] as? UIImage // setting the image to the image button
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
