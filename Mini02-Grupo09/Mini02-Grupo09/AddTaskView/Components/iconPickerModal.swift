//
//  iconPickerModal.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 03/10/23.
//

import Foundation
import UIKit


import UIKit

class Icon: UIControl {
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.cornerRadius = 8
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame)
        setup()
        imageView.image = image
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: 64),
            backgroundView.heightAnchor.constraint(equalToConstant: 56),
            
            imageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}


class iconPickerModalViewController: UIViewController {
    let iconsLabel = UILabel()
    let closeModalButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // Titulo da modal
        iconsLabel.translatesAutoresizingMaskIntoConstraints = false
        iconsLabel.text = "Ícones"
        iconsLabel.font = UIFont.systemFont(ofSize: 28, weight: .heavy)
        
        // Configuração do botão de fechar modal
        closeModalButton.translatesAutoresizingMaskIntoConstraints = false
        closeModalButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        view.addSubview(closeModalButton)
        
        // Separador
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .gray
        view.addSubview(separator)
        
        // Configuração da StackView que abriga icone, StackView de horário e título e botão de fechar
        let topStackView = UIStackView(arrangedSubviews: [iconsLabel, closeModalButton])
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.axis = .horizontal
        view.addSubview(topStackView)
        
        // Configurações das Stacks
        let firstStack = UIStackView()
        let secondStack = UIStackView()
        let rowsStack = UIStackView(arrangedSubviews: [firstStack, secondStack])
        let allStack = UIStackView(arrangedSubviews: [topStackView, separator, rowsStack])
        
        // Icones
        for icon in Icons.allCases {
            let aux = Icon(frame: CGRect(x: 0, y: 0, width: 0, height: 0), image: UIImage(named: icon.rawValue)!)
            view.addSubview(aux)
            if firstStack.arrangedSubviews.count < 4 {
                firstStack.addArrangedSubview(aux)
            } else {
                secondStack.addArrangedSubview(aux)
            }
        }
        
        // Configurações das Stacks
        
        // Primeira linha
        firstStack.translatesAutoresizingMaskIntoConstraints = false
        firstStack.axis = .horizontal
        firstStack.spacing = 80
        view.addSubview(firstStack)
        
        // Segunda linha
        secondStack.translatesAutoresizingMaskIntoConstraints = false
        secondStack.axis = .horizontal
        secondStack.spacing = 80
        view.addSubview(secondStack)
        
        // Primeira e segunda linha juntas
        rowsStack.translatesAutoresizingMaskIntoConstraints = false
        rowsStack.axis = .vertical
        rowsStack.spacing = 25
        view.addSubview(rowsStack)
        
        allStack.translatesAutoresizingMaskIntoConstraints = false
        allStack.axis = .vertical
        allStack.setCustomSpacing(5, after: topStackView)
        allStack.setCustomSpacing(30, after: separator)
        view.addSubview(allStack)
        

        NSLayoutConstraint.activate([
            
            separator.widthAnchor.constraint(equalToConstant: 292),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
//            allStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            allStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
            rowsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rowsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            

        ])
        
    }
}

