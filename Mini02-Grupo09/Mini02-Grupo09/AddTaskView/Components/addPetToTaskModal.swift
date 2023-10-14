//
//  addPetToTaskModal.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 05/10/23.
//

import Foundation
import UIKit

class addPetToTaskModalViewController: UIViewController {
    let superViewController: AddTaskViewController?
    let dogManager = DogManager.shared
    
    let modalLabel = UILabel()
    let closeModalButton = UIButton()
    
    let petsTableView = UITableView()
    
    var selectedIndices: Set<Int> = Set()
    
    init(superViewController: AddTaskViewController?) {
        self.superViewController = superViewController
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // Titulo da modal
        modalLabel.translatesAutoresizingMaskIntoConstraints = false
        modalLabel.text = String(localized: "Select the pet")
        modalLabel.font = UIFont(name: "Animal-Bold", size: 24)
        
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
        let topStackView = UIStackView(arrangedSubviews: [modalLabel, closeModalButton])
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.axis = .horizontal
        view.addSubview(topStackView)
        
        // Configurações da TableView
        petsTableView.dataSource = self
        petsTableView.delegate = self
        
        petsTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(petsTableView)
        
        petsTableView.register(CustomAddPetToTaskCell.self, forCellReuseIdentifier: "CustomAddPetToTaskCell")
        petsTableView.separatorStyle = .none
        
        let allStack = UIStackView(arrangedSubviews: [topStackView, separator, petsTableView])
        allStack.translatesAutoresizingMaskIntoConstraints = false
        allStack.axis = .vertical
        allStack.setCustomSpacing(5, after: topStackView)
        allStack.setCustomSpacing(26, after: separator)
        view.addSubview(allStack)
        
        NSLayoutConstraint.activate([
            
            separator.widthAnchor.constraint(equalToConstant: 316),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            allStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            allStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            allStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            petsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            petsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            petsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    @objc func closeModalButtonTapped() {
        for index in self.selectedIndices {
            let dog = self.dogManager.dogs[index]
            let pet: UIImageView = {
                let pet = UIImageView()
                pet.image = UIImage(data: dog.image!)
                pet.translatesAutoresizingMaskIntoConstraints = false
                pet.contentMode = .scaleAspectFill // scale mode
                pet.layer.cornerRadius = 24 // 48 (Tamanho do círculo) / 2
                pet.clipsToBounds = true
                NSLayoutConstraint.activate([
                    pet.widthAnchor.constraint(equalToConstant: 48),
                    pet.heightAnchor.constraint(equalToConstant: 48)])
                return pet
            }()
            superViewController?.newView.petsStackView.insertArrangedSubview(pet, at: 0)
            superViewController?.dogsArray.append(dog)
        }
        dismiss(animated: true, completion: nil)
    }
}

extension addPetToTaskModalViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Função que define a quantidade de linhas na tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogManager.dogs.count
    }

    // Função que chama a célula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dog = dogManager.dogs[indexPath.row] // Definindo o cachorro pela ordem do array de cachorros salvos
        let cell = CustomAddPetToTaskCell(style: .default, reuseIdentifier: "CustomAddPetToTaskCell", dogImage: UIImage(data: dog.image!), dogName: dog.name, petSelected: true)
        
        return cell
    }
    
    // Função que define uma ação ao clicar na célula
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let celula = tableView.cellForRow(at: indexPath) as? CustomAddPetToTaskCell {
            celula.petSelected.toggle()
            
            if !celula.petSelected {
                selectedIndices.insert(indexPath.row)
            } else {
                selectedIndices.remove(indexPath.row)
            }
        }
    }
    
    // Função para definir a altura da célula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // 76 (tamanho da célula em si) + 24 (espaçamento entre uma célula e outra)
    }
}
