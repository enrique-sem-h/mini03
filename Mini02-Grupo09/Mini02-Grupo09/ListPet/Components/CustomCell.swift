//
//  CustomCell.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 28/09/23.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var dog: Dog
    var isOpened = false
    
    //MARK: Itens a serem preenchidos pelo usuário
    let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .label
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let chevronImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "chevron.right") 
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
        label.text = "Name"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sizePlaceholder: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Size"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let agePlaceholder: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Age"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weightPlaceholder: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Weight"
        label.textColor = .black
        //label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = 7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: ESTRUTRA

    let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.backgroundColor = UIColor.lightGray
        v.layer.cornerRadius = 10
        return v
    }()

    let subcontainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = UIColor.white
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
    
    init(reuseIdentifier: String?, dog: Dog) {
        self.dog = dog
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupLabels()
        
        setupView()
    }
    
    func setupLabels(){
        myImageView.image = UIImage(data: (dog.image)!)
        name.text = dog.name
        nameDesc.text = dog.name
        size.text = dog.size
        age.text = "\(dog.age)"
        weight.text = "\(dog.weight)"
    }
    
    func setupView(){
        contentView.addSubview(container)

        stackTop.addArrangedSubview(myImageView)
        stackTop.addArrangedSubview(name)
        stackTop.addArrangedSubview(chevronImage)
        stackTop.setCustomSpacing(80, after: name)
        
        container.addSubview(stackTop)
        container.addSubview(subcontainer)
        container.addSubview(button)
        
        subcontainer.addSubview(stack)
        subcontainer.addSubview(stackTitle)
        
        stack.addArrangedSubview(nameDesc)
        stack.addArrangedSubview(size)
        stack.addArrangedSubview(age)
        stack.addArrangedSubview(weight)
        
        stackTitle.addArrangedSubview(namePlaceholder)
        stackTitle.addArrangedSubview(sizePlaceholder)
        stackTitle.addArrangedSubview(agePlaceholder)
        stackTitle.addArrangedSubview(weightPlaceholder)
        
        //tamanho do container
        NSLayoutConstraint.activate([
            
            stackTop.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            stackTop.heightAnchor.constraint(equalToConstant: 75),

            
            //container fundo
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            //foto
            myImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            myImageView.trailingAnchor.constraint(equalTo: name.leadingAnchor, constant: -10),
            myImageView.heightAnchor.constraint(equalToConstant: 76),
            myImageView.widthAnchor.constraint(equalToConstant: 76),
            
            //nome do cachorro
            name.topAnchor.constraint(equalTo: container.topAnchor, constant: 4),
            name.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            name.heightAnchor.constraint(equalToConstant: 40),
            name.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            chevronImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            chevronImage.trailingAnchor.constraint(equalTo: container.trailingAnchor),
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
            
            //botão de editar
            button.topAnchor.constraint(equalTo: subcontainer.bottomAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -50),
            button.widthAnchor.constraint(equalToConstant: 80),
            button.heightAnchor.constraint(equalToConstant: 20),

        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
