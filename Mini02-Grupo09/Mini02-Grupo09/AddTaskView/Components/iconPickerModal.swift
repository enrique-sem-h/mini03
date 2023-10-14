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
    weak var viewController: iconPickerModalViewController!
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        view.backgroundColor = UIColor(named: "Yellow")
        view.layer.cornerRadius = 8
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(frame: CGRect, image: UIImage, viewController: iconPickerModalViewController) {
        super.init(frame: frame)
        setup()
        imageView.image = image
        self.viewController = viewController
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
            
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: 64),
            backgroundView.heightAnchor.constraint(equalToConstant: 56),
            
            
            imageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 12),
            imageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -12)
        ])
        backgroundView.contentMode = .scaleAspectFit
    }
}


class iconPickerModalViewController: UIViewController {
    var iconPickerRoot: IconPicker!
    let iconsLabel = UILabel()
    let closeModalButton = UIButton()
    
    init(iconPickerRoot: IconPicker) {
        self.iconPickerRoot = iconPickerRoot
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // Titulo da modal
        iconsLabel.translatesAutoresizingMaskIntoConstraints = false
        iconsLabel.text = String(localized: "Icons")
        iconsLabel.font = UIFont(name: "Animal-Bold", size: 30)
        
        // Configuração do botão de fechar modal
        closeModalButton.translatesAutoresizingMaskIntoConstraints = false
        closeModalButton.setImage(UIImage(named: "CloseModalButtonX"), for: .normal)
        closeModalButton.addTarget(self, action: #selector(closeModalButtonTapped), for: .touchUpInside)
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
        
        // Icones
        for icon in Icons.allCases {
            let aux = Icon(frame: CGRect(x: 0, y: 0, width: 0, height: 0), image: UIImage(named: icon.rawValue)!, viewController: self)
            aux.addTarget(self, action: #selector(changeIcon(_:)), for: .touchUpInside)
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
        firstStack.distribution = .fillEqually
        firstStack.spacing = 20
        view.addSubview(firstStack)
        
        // Segunda linha
        secondStack.translatesAutoresizingMaskIntoConstraints = false
        secondStack.axis = .horizontal
        secondStack.distribution = .fillEqually
        secondStack.spacing = 20
        view.addSubview(secondStack)
        
        // Primeira e segunda linha juntas
        
        let allStack = UIStackView(arrangedSubviews: [topStackView, separator, firstStack, secondStack])
        allStack.translatesAutoresizingMaskIntoConstraints = false
        allStack.axis = .vertical
        allStack.setCustomSpacing(5, after: topStackView)
        allStack.setCustomSpacing(26, after: separator)
        allStack.setCustomSpacing(26, after: firstStack)
        view.addSubview(allStack)
        

        NSLayoutConstraint.activate([
            
            separator.widthAnchor.constraint(equalToConstant: 316),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            allStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
    }
    
    @objc func closeModalButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func changeIcon(_ sender: Icon) {
        iconPickerRoot.iconView.image = sender.imageView.image
        dismiss(animated: true, completion: nil)
    }
}

