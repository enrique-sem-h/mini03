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
    
    let dogImage: UIImageView = {
        let dogImage = UIImageView()
        dogImage.translatesAutoresizingMaskIntoConstraints = false
        dogImage.contentMode = .scaleAspectFill // scale mode
        dogImage.layer.cornerRadius = 37 // 74 (Tamanho do círculo) / 2
        dogImage.clipsToBounds = true
        return dogImage
    }()
    
    let dogName: UILabel = {
        let dogName = UILabel()
        dogName.translatesAutoresizingMaskIntoConstraints = false
        dogName.font = UIFont(name: "Animal-Bold", size: 26)
        return dogName
    }()
    
    var petSelected: Bool = false {
        didSet {
            symbolSelected.isHidden.toggle()
        }
    }
    
    let symbolSelected: UIImageView = {
        let symbolSelected = UIImageView()
        symbolSelected.translatesAutoresizingMaskIntoConstraints = false
        symbolSelected.image = UIImage(systemName: "checkmark.circle")
        symbolSelected.tintColor = UIColor(named: "Red")
        symbolSelected.isHidden = true
        return symbolSelected
    }()

    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, dogImage: UIImage?, dogName: String?, petSelected: Bool) {
        self.dogImage.image = dogImage
        self.dogName.text = dogName
        self.petSelected = petSelected

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Configurar a célula com os dados passados nos parâmetros
        setup()
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.selectionStyle = .none // Desligando a animação da seleção da célula
        
        contentView.addSubview(dogImage)
        
        contentView.addSubview(dogName)
        
        contentView.addSubview(symbolSelected)
        
        NSLayoutConstraint.activate([
            
            dogImage.widthAnchor.constraint(equalToConstant: 74),
            dogImage.heightAnchor.constraint(equalToConstant: 74),
            dogImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            dogImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            dogName.leadingAnchor.constraint(equalTo: dogImage.trailingAnchor, constant: 70),
            dogName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            symbolSelected.widthAnchor.constraint(equalToConstant: 38),
            symbolSelected.heightAnchor.constraint(equalToConstant: 38),
            symbolSelected.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            symbolSelected.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

