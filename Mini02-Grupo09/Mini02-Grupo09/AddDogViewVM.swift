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
    weak var controller: AddDogViewController?
    
    init(dogManager: DogManager) {
        self.dogManager = dogManager // initializing CD manager
    }
    
    func addDog(image: UIImage, name: String?, age: String, weight: String, size: String, viewController: UIViewController) {
        guard let name = name, let age = Int(age), let weight = Float(weight), let size = DogManager.Size(rawValue: size) else {
            controller?.errorAlert()
            return
        } // safely unwrapping each parameter
        dogManager.newDog(image: image, name: name, age: age, weight: weight, size: size) // adding new dog to core data
        HapticsManager.shared.vibrate(for: .success) // triggering system's default vibration for success
        viewController.dismiss(animated: true) // going back to previous view
    }
    
    func firstResponderHandler(nameTF: UITextField, ageTF: UITextField, sizeTF: UITextField, weightTF: UITextField, agePicker: UIDatePicker){ // handling first responder function for view controller
        if nameTF.isFirstResponder { // bool for name textfield's first responder
            nameTF.resignFirstResponder() // dismiss first responder for name textfield
        } else if ageTF.isFirstResponder {// bool for age textfield's first responder
            ageTF.resignFirstResponder() // resigning it when clicking done
        } else if sizeTF.isFirstResponder { // bool for size textfield's first responder
            sizeReturner(sizeTF)
            sizeTF.resignFirstResponder() // resigning the first responder (picker)
        } else if weightTF.isFirstResponder { // bool for weight textfield's first responder
            weightTF.resignFirstResponder() // resigning the first responder (picker)
        }
        HapticsManager.shared.vibrate(for: .success)
    }
    
    func sizeReturner(_ sizeTF:UITextField){
        if sizeTF.text == ""{
            sizeTF.text = dogManager.fetchEnum.first?.rawValue
        }
    }
    
}
