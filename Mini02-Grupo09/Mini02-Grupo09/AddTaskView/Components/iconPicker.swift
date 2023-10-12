//
//  iconPicker.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 30/09/23.
//

import Foundation
import UIKit

enum Icons: String, CaseIterable {
    case ball = "BallImage"
    case brush = "BrushImage"
    case food = "FoodImage"
    case leash = "LeashImage"
    case remedy = "RemedyImage"
    case scissors = "ScissorsImage"
    case shampoo = "ShampooImage"
    case vaccine = "VaccineImage"
}

class IconPicker: UIControl {
    weak var viewController: AddTaskViewController?
    private var iconPicker = UIImageView()
    var iconView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        iconPicker.translatesAutoresizingMaskIntoConstraints = false
        iconPicker.image = UIImage(named: "iconPicker")
        addSubview(iconPicker)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = UIImage(named: Icons.food.rawValue)
        iconPicker.addSubview(iconView)
        
        NSLayoutConstraint.activate([
            iconPicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconPicker.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconPicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconPicker.topAnchor.constraint(equalTo: topAnchor),
            
            iconView.leadingAnchor.constraint(equalTo: iconPicker.leadingAnchor, constant: 16),
            iconView.topAnchor.constraint(equalTo: iconPicker.topAnchor, constant: 12),
            iconView.trailingAnchor.constraint(equalTo: iconPicker.trailingAnchor, constant: -16),
            iconView.bottomAnchor.constraint(equalTo: iconPicker.bottomAnchor, constant: -12)
        ])
    }    
}
