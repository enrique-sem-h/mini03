//
//  EditDogViewModel.swift
//  Mini02-Grupo09
//
//  Created by Enrique Carvalho on 06/10/23.
//

import Foundation
import UIKit

class EditDogViewModel{
    let dogManager = DogManager.shared // defining core data manager
    weak var controller: EditDogViewController?
    
    func editDog(image: UIImage, name: String?, age: String, weight: String, size: String, viewController: UIViewController) {
        guard let name = name, let age = Int(age), let weight = Float(weight), let size = DogManager.Size(rawValue: size), let controller = self.controller else {
            controller?.errorAlert()
            return
        } // safely unwrapping each parameter
        dogManager.edit(image: image, dog: controller.dog, name: name, age: age, size: size, weight: weight) // adding new dog to core data
        HapticsManager.shared.vibrate(for: .success) // triggering system's default vibration for success
        viewController.dismiss(animated: true) // going back to previous view
    }
    
    func firstResponderHandler(nameTF: UITextField, ageTF: UITextField, sizeTF: UITextField, weightTF: UITextField, agePicker: UIDatePicker){ // handling first responder function for view controller
        if nameTF.isFirstResponder { // bool for name textfield's first responder
            nameTF.resignFirstResponder() // dismiss first responder for name textfield
        } else if ageTF.isFirstResponder {// bool for age textfield's first responder
            let calendar = Calendar.current // defining calendar
            let currentDate = Date() // defining current date
            let selectedDate = agePicker.date // defining picked date
            
            let ageComponents = calendar.dateComponents([.year], from: selectedDate, to: currentDate) // returning the diference between the year picked and the current
            
            if let years = ageComponents.year { // safely unwrapping the year for age component
                ageTF.text = "\(years)" // attributing it to the textField
            } else {
                print("Invalid Date") // in case of failure to unwrap the year (probably won't happen)
            }
            
            ageTF.resignFirstResponder() // resigning it when clicking done
        } else if sizeTF.isFirstResponder { // bool for size textfield's first responder
            if sizeTF.text == ""{
                sizeTF.text = dogManager.fetchEnum.first?.rawValue
            }
            sizeTF.resignFirstResponder() // resigning the first responder (picker)
        } else if weightTF.isFirstResponder { // bool for weight textfield's first responder
            weightTF.resignFirstResponder() // resigning the first responder (picker)
        }
        HapticsManager.shared.vibrate(for: .success)
    }
    
}