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
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let firstStack = UIStackView()
        firstStack.translatesAutoresizingMaskIntoConstraints = false
        firstStack.axis = .horizontal
        firstStack.spacing = 80
        view.addSubview(firstStack)

        let secondStack = UIStackView()
        secondStack.translatesAutoresizingMaskIntoConstraints = false
        secondStack.axis = .horizontal
        secondStack.spacing = 80
        view.addSubview(secondStack)

        let allStack = UIStackView(arrangedSubviews: [firstStack, secondStack])
        allStack.translatesAutoresizingMaskIntoConstraints = false
        allStack.axis = .vertical
        allStack.spacing = 80
        view.addSubview(allStack)

        for icon in Icons.allCases {
            let aux = Icon(frame: CGRect(x: 0, y: 0, width: 0, height: 0), image: UIImage(named: icon.rawValue)!)
            view.addSubview(aux)
            if firstStack.arrangedSubviews.count < 4 {
                firstStack.addArrangedSubview(aux)
            } else {
                secondStack.addArrangedSubview(aux)
            }
        }

        NSLayoutConstraint.activate([
            allStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}

