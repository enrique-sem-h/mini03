//
//  CustomAddPetToTaskCell.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 05/10/23.
//

import Foundation
import UIKit

class CustomAddPetToTaskCell: UITableViewCell {
    let dogManager = DogManager.shared
    
    let dogImage: UIImageView = UIImageView()
    let dogName: String?
    let petSelected: Bool?

    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, dogImage: UIImage?, dogName: String?, petSelected: Bool?) {
        self.dogImage.image = dogImage
            self.dogName = dogName
            self.petSelected = petSelected

            super.init(style: style, reuseIdentifier: reuseIdentifier)

            // Configurar a célula com os dados passados nos parâmetros
            setup()
        }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        
        dogImage.image = UIImage(systemName: "square.and.arrow.up")
        dogImage.translatesAutoresizingMaskIntoConstraints = false
        dogImage.contentMode = .scaleAspectFill // scale mode
        dogImage.layer.masksToBounds = false // disabling mask to bounds
        dogImage.clipsToBounds = true // enabling bound clipping
        dogImage.translatesAutoresizingMaskIntoConstraints = false // disabling autoresize mask to const.
        dogImage.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == .phone ? 130 / 10 : 170 / 10
        contentView.addSubview(dogImage)
        
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Teste"
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
//            dogImage.leadingAnchor.constraint(equalTo: leadingAnchor),
//            dogImage.bottomAnchor.constraint(equalTo: bottomAnchor),
//            dogImage.trailingAnchor.constraint(equalTo: trailingAnchor),
//            dogImage.topAnchor.constraint(equalTo: topAnchor),
//            dogImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            dogImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

