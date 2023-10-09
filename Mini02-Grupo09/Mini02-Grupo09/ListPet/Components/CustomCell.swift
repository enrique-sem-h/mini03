//
//  CustomCell.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 28/09/23.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var dog: Dog
    var listViewController: ListViewController
    var isOpened = false
    
    //MARK: Itens a serem preenchidos pelo usuário
    let title:UILabel = {
        let iv = UILabel()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.text = String("List")
        iv.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        iv.textAlignment = .center
        iv.backgroundColor = .lightGray
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
        iv.image = UIImage(systemName: "chevron.right")
        iv.tintColor = .label
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let chevronDown: UIImageView = {
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
        button.setTitleColor(.systemRed, for: .normal)
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.tintColor = .systemRed
        button.layer.cornerRadius = 7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = false
        return button
    }()

    
    //MARK: ESTRUTRA
    
    let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.backgroundColor = UIColor.systemYellow
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
    
    init(reuseIdentifier: String?, dog: Dog, listViewController: ListViewController) {
        self.dog = dog
        self.listViewController = listViewController
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        container.layer.masksToBounds = false
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.3
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.layer.shadowRadius = 4
        
        setupLabels()
        setupView()
        
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
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
    
    func setupView(){
        contentView.addSubview(container)
        
        if let imageData = dog.image {
            myImageView.image = UIImage(data: imageData)
        }
        myImageView.layer.cornerRadius = 35
        
        
        stackTop.addArrangedSubview(myImageView)
        stackTop.addArrangedSubview(name)
        stackTop.addArrangedSubview(chevronImage)
        stackTop.addArrangedSubview(chevronDown)
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
                
                //Chevron após expansão da célula
                chevronDown.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
                chevronDown.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
                chevronDown.heightAnchor.constraint(equalToConstant: 20),
                chevronDown.widthAnchor.constraint(equalToConstant: 20),
                
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
//                button.widthAnchor.constraint(equalToConstant: 80),
//                button.heightAnchor.constraint(equalToConstant: 20),
                
            ])
        } else {
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
            
            //Chevron após expansão da célula
            chevronDown.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            chevronDown.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            chevronDown.heightAnchor.constraint(equalToConstant: 20),
            chevronDown.widthAnchor.constraint(equalToConstant: 20),
            
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
    
    @objc func editButtonTapped() {
        // Obtém a referência à superview até chegar à UITableView
        
        var responder: UIResponder? = self
        while responder != nil && !(responder is UITableView) {
            responder = responder?.next
        }
        
        // Verifica se a superview é uma UITableView e obtém a célula selecionada
        if let tableView = responder as? UITableView{
            // Obtém a referência à UIViewController que contém a UITableView
            if let viewController = tableView.delegate as? UIViewController {
                // Cria a EditDogView e passa o objeto 'dog'
                let editDogViewController = AddDogViewController(with: dog)
                editDogViewController.listViewController = self.listViewController
                
                viewController.navigationController?.isNavigationBarHidden = true
                viewController.navigationController?.pushViewController(editDogViewController, animated: true)
            }
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
