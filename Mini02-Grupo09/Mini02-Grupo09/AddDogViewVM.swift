//
//  AddDogViewVM.swift
//  Mini02-Grupo09
//
//  Created by Enrique Carvalho on 27/09/23.
//

import Foundation
import UIKit

class AddDogViewModel{
    let dogManager: DogManager // defining core data manager
    
    init(dogManager: DogManager) {
        self.dogManager = dogManager // initializing CD manager
    }
    
    func addDog(image: UIImage?, name: String?, age: String, weight: String, size: String) {
        guard let image = image, let name = name, let age = Int(age), let weight = Float(weight), let size = DogManager.Size(rawValue: size) else { return } // safely unwrapping each parameter
        dogManager.newDog(image: image, name: name, age: age, weight: weight, size: size) // adding new dog to core data
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
                sizeTF.text = "mini"
            }
            sizeTF.resignFirstResponder() // resigning the first responder (picker)
        } else if weightTF.isFirstResponder { // bool for weight textfield's first responder
            weightTF.resignFirstResponder() // resigning the first responder (picker)
        }
    }
    
}
