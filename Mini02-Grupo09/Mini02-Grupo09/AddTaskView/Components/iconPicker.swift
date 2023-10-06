//
//  iconPicker.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 30/09/23.
//

import Foundation
import UIKit

enum Icons: String, CaseIterable {
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
            
            iconView.centerXAnchor.constraint(equalTo: iconPicker.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: iconPicker.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 20),
            iconView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }    
}
