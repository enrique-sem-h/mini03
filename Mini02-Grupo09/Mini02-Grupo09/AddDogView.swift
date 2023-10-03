//
//  AddDogView.swift
//  Mini02-Grupo09
//
//  Created by Enrique Carvalho on 27/09/23.
//

import Foundation
import UIKit

class AddDogView: UIView{
    // MARK: setting all view components
    let sizePicker = UIPickerView() // defining picker for the dog's size (enum)
    let stack = UIStackView()
    let nameTF = UITextField()
    let ageTF = UITextField()
    let sizeTF = UITextField()
    let weightTF = UITextField()
    let imgButton = UIImageView()
    let imagePicker = UIImagePickerController()
    let agePicker = UIDatePicker()
    var button = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground // defining bg color to adapt to dark mode
        configureStack() // configuring the whole view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        imgButton.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == .phone ? 130 / 2 : 170 / 2 // rounding it (170 is its height and width constraints)
        
        imagePicker.allowsEditing = true // allowing the user to edit the image before inserting it
        imagePicker.sourceType = .photoLibrary // defining source type

        nameTF.placeholder = "Name" // name textfield's placeholder
        nameTF.borderStyle = .roundedRect // defining its borders
        nameTF.translatesAutoresizingMaskIntoConstraints = false // disabling autoresize mask to const.
        nameTF.returnKeyType = .done // defining keyboard return button
        nameTF.enablesReturnKeyAutomatically = true // dinamically enabling return btn.
        
        
        agePicker.datePickerMode = .date // defining datePicker
        agePicker.preferredDatePickerStyle = .wheels // setting its style
        agePicker.maximumDate = .now // limiting date
        ageTF.placeholder = "Age" // date textfield placeholder
        ageTF.inputView = agePicker // defining textfield's input mode to picker
        
        ageTF.borderStyle = .roundedRect // rounding textfield's border
        ageTF.translatesAutoresizingMaskIntoConstraints = false // disabling autoresizing mask translation
        
        
        sizePicker.tag = 1 // tagging it
        sizeTF.placeholder = "Size" // size textfield's placeholder
        sizeTF.inputView = sizePicker // defining input to picker
        
        sizeTF.borderStyle = .roundedRect // rounding its borders
        sizeTF.translatesAutoresizingMaskIntoConstraints = false // disabling autoresizing mask translation
        
        weightTF.placeholder = "Weight" // weight textfield's placeholder
        weightTF.keyboardType = .decimalPad // setting its keyboard type
        weightTF.borderStyle = .roundedRect // rounding its borders
        
        weightTF.translatesAutoresizingMaskIntoConstraints = false // disabling autoresizing mask translation
                
        button.configuration = .borderless() // defining its configs
        button.configuration?.title = "Add" // setting a text to it
        
        
        self.addSubview(imgButton) // adding the image as a subview
        stack.addArrangedSubview(nameTF) // adding the name textfield as a stack's arranged subview
        stack.addArrangedSubview(ageTF) // adding the age textfield as a stack's arranged subview
        stack.addArrangedSubview(sizeTF) // adding the size textfield as a stack's arranged subview
        stack.addArrangedSubview(weightTF) // adding the weight textfield as a stack's arranged subview
        stack.addArrangedSubview(button) // adding the submit button as a stack's arranged subview
        
        self.addSubview(stack) // adding the stack itself as a subview
        
        if UIDevice.current.userInterfaceIdiom == .phone{
            // Constraints for the iPhone
            NSLayoutConstraint.activate([
                nameTF.heightAnchor.constraint(equalToConstant: 70), // configuring the textfields sizes
                
                imgButton.widthAnchor.constraint(equalToConstant: 130), // defining image's size
                imgButton.heightAnchor.constraint(equalToConstant: 130), // defining image's size
                
                imgButton.centerXAnchor.constraint(equalTo: self.centerXAnchor), // defining image's position
                imgButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0), // defining image's position
                
                stack.topAnchor.constraint(equalTo: imgButton.bottomAnchor, constant: 20), // setting stack's position
                stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50), // setting stack's position
                stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50), // setting stack's position
                stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200), // setting stack's position
            ])
        }else{
            // Constraints for the iPad
            NSLayoutConstraint.activate([
                nameTF.heightAnchor.constraint(equalToConstant: 100), // configuring the textfields sizes
                
                imgButton.widthAnchor.constraint(equalToConstant: 170), // defining image's size
                imgButton.heightAnchor.constraint(equalToConstant: 170), // defining image's size
                
                imgButton.centerXAnchor.constraint(equalTo: self.centerXAnchor), // defining image's position
                imgButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0), // defining image's position
                
                stack.topAnchor.constraint(equalTo: imgButton.bottomAnchor, constant: 20), // setting stack's position
                stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70), // setting stack's position
                stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70), // setting stack's position
            ])
        }
    }
    
    // MARK: defining the delegate function, which is called in the view controller
    
    func createDelegate(delegate: AddDogViewController){
        sizePicker.delegate = delegate // setting its delegate
        sizePicker.dataSource = delegate // setting its data source
        imagePicker.delegate = delegate // defining imagePicker's delegate
        nameTF.delegate = delegate
    }
    
}
