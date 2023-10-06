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
    
    func editDog(image: UIImage, name: String?, age: String, weight: String, size: String, viewController: ListViewController?) {
        guard let name = name, let age = Int(age), let weight = Float(weight), let size = DogManager.Size(rawValue: size), let controller = self.controller else {
            controller?.errorAlert()
            return
        } // safely unwrapping each parameter
        dogManager.edit(image: image, dog: controller.dog, name: name, age: age, size: size, weight: weight) // adding new dog to core data
        HapticsManager.shared.vibrate(for: .success) // triggering system's default vibration for success
        if let viewController = viewController{
            viewController.navigationController?.popViewController(animated: true) // going back to previous view
            viewController.tableView.reloadData()
        }
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
