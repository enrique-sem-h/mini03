//
//  RegisterViewController.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 22/09/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Variables
   // var sections = [Section]()
    
    let testes:[Section] = [
                    Section(title: "Kalel", options: ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"].compactMap({return "Cells \($0)"})),
                    Section(title: "Drake", options: ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", "teste"].compactMap({return "Cells \($0)"})),
                    Section(title: "Josh", options: ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"].compactMap({return "Cells \($0)"})),
                    Section(title: "Bruce", options: ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"].compactMap({return "Cells \($0)"}))
    ]
    
    // MARK: UI Components
    let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 800), style: .insetGrouped)
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.backgroundColor = .systemBackground
        return tableView
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
    }
    
    
    // MARK: Setup UI
    
    func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        let padding: CGFloat = 15
        tableView.layoutMargins = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: self.view.topAnchor)])
        NSLayoutConstraint.activate([tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)])
        NSLayoutConstraint.activate([tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)])
        NSLayoutConstraint.activate([tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return testes.count
    }
    
    //MARK: Expansão da celula
    func tableView(_ tableView: UITableView, numberOfRowsInSection teste: Int) -> Int {
        let teste = testes[teste]
        if teste.isOpened {
            return 2
        } else {
            return 1
        }
    }
    
    //MARK: Personalização da célula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("The TableView could not dequeue a CustomCell in ViewController.")
        }
        var content = cell.defaultContentConfiguration()
        content.text = testes[indexPath.section].title
        cell.backgroundColor = .lightGray
        
//        if indexPath.row == 0 {
//            content.text = testes[indexPath.section].title
//            cell.contentConfiguration = content
//            cell.backgroundColor = .lightGray
//        }
//        else {
//            content.text = testes [indexPath.section].options[indexPath.row - 1]
//            cell.contentConfiguration = content
//            cell.backgroundColor = .lightGray
//        }
        
        return cell
    }
    
    //MARK: Quando tocar no botão
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            testes[indexPath.section].isOpened = !testes[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
        else {
            print("tocado")
        }
        
    }
}
