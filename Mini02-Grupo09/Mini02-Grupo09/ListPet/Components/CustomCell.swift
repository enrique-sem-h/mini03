//
//  CustomCell.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 28/09/23.
//

import UIKit

class CustomCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    let dog: Dog
    
    var editButtonCallback: (() -> Void)?
    
    //MARK: Itens a serem preenchidos pelo usuário
    let title: UILabel = {
        let iv = UILabel()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.text = String(localized: "Name")
        iv.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        iv.textAlignment = .center
        iv.backgroundColor = UIColor(named: "White")
        return iv
    }()
    
    let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .label
        iv.layer.cornerRadius = 35
        iv.clipsToBounds = true
        iv.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let chevronImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "chevron.down")
        iv.tintColor = .label
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameDesc: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let size: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let age: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weight: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Títulos
    let namePlaceholder: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = String(localized: "Name")
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sizePlaceholder: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = String(localized: "Size")
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let agePlaceholder: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = String(localized: "Age")
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weightPlaceholder: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = String(localized: "Weight")
        label.textColor = .black
        //label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle(String(localized: "Edit Pet"), for: .normal)
        button.setTitleColor(UIColor(named: "Red"), for: .normal)
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.tintColor = UIColor(named: "Red")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: ESTRUTRA
    
    let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.backgroundColor = UIColor(named: "Yellow")
        v.layer.cornerRadius = 10
        return v
    }()
    
    let subcontainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = UIColor(named: "White")
        view.layer.cornerRadius = 12
        return view
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let stackTitle: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let stackTop: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init(dog: Dog) {
        self.dog = dog
        
        super.init(style: .default, reuseIdentifier: CustomCell.identifier)
        
        container.layer.masksToBounds = false
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.3
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.layer.shadowRadius = 4
        
        setupLabels()
        setupView()
        
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabels(){
        myImageView.image = UIImage(data: (dog.image)!)
        name.text = dog.name
        nameDesc.text = dog.name
        size.text = dog.size
        age.text = "\(dog.age) " + String(localized: "years")
        weight.text = weightCalc()
    }
    
    func weightCalc() -> String{
        if dog.weight > 1{
            return "\(dog.weight) Kg"
        } else {
            return "\(dog.weight * 1000) g"
        }
    }
    
    @objc func editButtonTapped() {
        editButtonCallback?()
    }
    
    func setupView(){
        contentView.addSubview(container)
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        
        if let imageData = dog.image {
            myImageView.image = UIImage(data: imageData)
        }
        myImageView.layer.cornerRadius = 35
        
        stackTop.addArrangedSubview(myImageView)
        stackTop.addArrangedSubview(name)
        stackTop.addArrangedSubview(chevronImage)
        stackTop.setCustomSpacing(80, after: name)
        
        container.addSubview(stackTop)
        container.addSubview(subcontainer)
        
        subcontainer.addSubview(stack)
        subcontainer.addSubview(stackTitle)
        subcontainer.addSubview(button)
        
        stack.addArrangedSubview(nameDesc)
        stack.addArrangedSubview(size)
        stack.addArrangedSubview(age)
        stack.addArrangedSubview(weight)
        
        stackTitle.addArrangedSubview(namePlaceholder)
        stackTitle.addArrangedSubview(sizePlaceholder)
        stackTitle.addArrangedSubview(agePlaceholder)
        stackTitle.addArrangedSubview(weightPlaceholder)
        
        //tamanho do container para iphone
        if UIDevice.current.userInterfaceIdiom == .phone{
            NSLayoutConstraint.activate([
                
                stackTop.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
                stackTop.heightAnchor.constraint(equalToConstant: 75),
                
                //container fundo
                container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
                container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                
                //foto
                myImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
                myImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 28),
                myImageView.bottomAnchor.constraint(equalTo: subcontainer.topAnchor, constant: -24),
                myImageView.trailingAnchor.constraint(equalTo: name.leadingAnchor, constant: -5),
                myImageView.heightAnchor.constraint(equalToConstant: 70),
                myImageView.widthAnchor.constraint(equalToConstant: 70),
                
                //nome do cachorro
                name.topAnchor.constraint(equalTo: container.topAnchor, constant: 4),
                name.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 5),
                name.heightAnchor.constraint(equalToConstant: 40),
                
                //Chevron antes da expansão da célula
                chevronImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
                chevronImage.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
                chevronImage.heightAnchor.constraint(equalToConstant: 20),
                chevronImage.widthAnchor.constraint(equalToConstant: 20),
                
                //subcontainer
                subcontainer.topAnchor.constraint(equalTo: container.topAnchor, constant: 105),
                subcontainer.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 28),
                subcontainer.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -44),
                subcontainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -28),
                
                //Stack Title
                stackTitle.topAnchor.constraint(equalTo: subcontainer.topAnchor, constant: 20),
                stackTitle.leadingAnchor.constraint(equalTo: subcontainer.leadingAnchor, constant: 40),
                stackTitle.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -100),
                
                //Stack
                stack.topAnchor.constraint(equalTo: subcontainer.topAnchor, constant: 20),
                stack.leadingAnchor.constraint(equalTo: stackTitle.leadingAnchor, constant: 100),
                stack.trailingAnchor.constraint(equalTo: subcontainer.trailingAnchor, constant: -40),
                
                // botão de editar
                button.topAnchor.constraint(equalTo: subcontainer.bottomAnchor, constant: -30),
                button.trailingAnchor.constraint(equalTo: subcontainer.trailingAnchor, constant: -40),
            ])
            
        } else {
            NSLayoutConstraint.activate([
                
                stackTop.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
                stackTop.heightAnchor.constraint(equalToConstant: 75),
                
                //container fundo
                container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
                container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 194),
                container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -194),
                
                //foto
                myImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
                myImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 28),
                myImageView.bottomAnchor.constraint(equalTo: subcontainer.topAnchor, constant: -24),
                myImageView.trailingAnchor.constraint(equalTo: name.leadingAnchor, constant: -5),
                myImageView.heightAnchor.constraint(equalToConstant: 70),
                myImageView.widthAnchor.constraint(equalToConstant: 70),
                
                //nome do cachorro
                name.topAnchor.constraint(equalTo: container.topAnchor, constant: 4),
                name.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 5),
                name.heightAnchor.constraint(equalToConstant: 40),
                
                //Chevron antes da expansão da célula
                chevronImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
                chevronImage.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
                chevronImage.heightAnchor.constraint(equalToConstant: 20),
                chevronImage.widthAnchor.constraint(equalToConstant: 20),
                
                //subcontainer
                subcontainer.topAnchor.constraint(equalTo: container.topAnchor, constant: 105),
                subcontainer.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 28),
                subcontainer.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -64),
                subcontainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -28),
                
                //Stack Title
                stackTitle.topAnchor.constraint(equalTo: subcontainer.topAnchor, constant: 20),
                stackTitle.leadingAnchor.constraint(equalTo: subcontainer.leadingAnchor, constant: 40),
                stackTitle.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -100),
                
                //Stack
                stack.topAnchor.constraint(equalTo: subcontainer.topAnchor, constant: 20),
                stack.leadingAnchor.constraint(equalTo: stackTitle.leadingAnchor, constant: 100),
                stack.trailingAnchor.constraint(equalTo: subcontainer.trailingAnchor, constant: -40),
                
                // botão de editar
                button.bottomAnchor.constraint(equalTo: subcontainer.bottomAnchor, constant: 30),
                button.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -50),
                button.widthAnchor.constraint(equalToConstant: 80),
                button.heightAnchor.constraint(equalToConstant: 20),
            ])
        }
    }
}
