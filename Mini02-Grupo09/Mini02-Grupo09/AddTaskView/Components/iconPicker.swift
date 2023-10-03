//
//  iconPicker.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 30/09/23.
//

import Foundation
import UIKit

enum Icon: String {
    case vaccine = "VaccineImage"
    case remedy = "RemedyImage"
    case food = "FoodImage"
    case tour = "TourImage"
    case bath = "BathImage"
    case brush = "BrushImage"
    case play = "PlayImage"
    case bandaid = "BandaidImage"
}

class IconPicker: UIControl {
    weak var viewController: AddTaskViewController?
    private var iconPicker: UIImageView!
    var iconView: UIImageView!
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        iconPicker.translatesAutoresizingMaskIntoConstraints = false
        iconPicker.image = UIImage(named: "iconPicker")
        addSubview(iconPicker)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = UIImage(named: Icon.food.rawValue)
        iconPicker.addSubview(iconView)
        
        NSLayoutConstraint.activate([
            iconPicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconPicker.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconPicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconPicker.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    @objc func touchUpInside() {
        let vc = iconPickerModalViewController()
        
        let navVC = UINavigationController(rootViewController: vc)
        navVC.setNavigationBarHidden(true, animated: false)
        
        if let sheet = navVC.sheetPresentationController {
            sheet.preferredCornerRadius = 12
            sheet.detents = [.custom(resolver: { context in
                226
            })]
        }
        viewController?.present(navVC, animated: true)

    }
    
}
