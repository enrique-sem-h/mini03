//
//  AddTaskViewController.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 29/09/23.
//

import Foundation
import UIKit

class AddTaskViewController: UIViewController {
    let newView = AddTaskView()
    let viewModel = AddTaskViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Configuração da view
        newView.frame = view.frame
        self.view = newView
        newView.setup()
    }
}

extension AddTaskViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    
}

extension UITextField {
    func addBottomBorderWithColor(color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(border)
    }
}
