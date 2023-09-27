//
//  RegisterViewController.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 22/09/23.
//

import Foundation
import UIKit


class Section {
    let title: String
    let options: [String]
    let sectionImage: UIImage?
    var isOpened = false
    
    init(title: String, options: [String], isOpened: Bool = false, sectionImage: UIImage?) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
        self.sectionImage = sectionImage
    }
}

class RegisterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 800), style: .insetGrouped)
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = [
            Section(title: "Kalel", options: ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"].compactMap({return "Cells \($0)"}), sectionImage: (UIImage(named: "dog"))),
            Section(title: "Drake", options: ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", "teste"].compactMap({return "Cells \($0)"}), sectionImage: (UIImage(named: "dog"))),
            Section(title: "Josh", options: ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"].compactMap({return "Cells \($0)"}), sectionImage: (UIImage(named: "dog"))),
            Section(title: "Bruce", options: ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"].compactMap({return "Cells \($0)"}), sectionImage: (UIImage(named: "dog"))),
        ]
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        
        if section.isOpened {
            return 2
        } else {
            return 1
        }
    }
    
    //MARK: Personalização da célula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        if indexPath.row == 0 {
            content.text = sections[indexPath.section].title
            
            cell.contentConfiguration = content
            cell.backgroundColor = .lightGray
            cell.largeContentImage = UIImage(named: "dog")
        }
        else {
            content.text = sections [indexPath.section].options[indexPath.row - 1]
            
            cell.contentConfiguration = content
            cell.backgroundColor = .lightGray
        }
        
        return cell
    }
    
    //MARK: Quando tocar no botão
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
        else {
            print("tocado")
        }
        
    }
}
