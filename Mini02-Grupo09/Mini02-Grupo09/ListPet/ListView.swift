//
//  ListView.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 06/10/23.
//

import Foundation
import UIKit

class ListView: UIView {
    
    let tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.backgroundColor = .clear
        
        return tb
    }()
    
    let backButton: UIButton = {
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = UIColor(named: "Red")
        return backButton
    }()
    
    let viewTitle: UILabel = {
        let viewTitle = UILabel()
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        viewTitle.font = UIFont(name: "Animal-Bold", size: 24)
        viewTitle.text = String(localized: "Your Pets")
        viewTitle.textColor = UIColor(named: "HeaderTitle")
        viewTitle.textAlignment = .center
        viewTitle.backgroundColor = UIColor(named: "ViewHeader")
        return viewTitle
    }()
    
    let addDogButton: UIButton = {
        let addDogButton = UIButton()
        addDogButton.translatesAutoresizingMaskIntoConstraints = false
        addDogButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        addDogButton.tintColor = UIColor(named: "Red")
        return addDogButton
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        self.addSubview(viewTitle)
        
        self.addSubview(backButton)
        
        self.addSubview(addDogButton)
        
        self.addSubview(tableView)

        self.backgroundColor = UIColor(named: "Background")
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 28),
            backButton.centerYAnchor.constraint(equalTo: viewTitle.centerYAnchor),
            
            viewTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            viewTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewTitle.heightAnchor.constraint(equalToConstant: 74),
            
            addDogButton.imageView!.widthAnchor.constraint(equalToConstant: 34),
            addDogButton.imageView!.heightAnchor.constraint(equalToConstant: 34),
            addDogButton.widthAnchor.constraint(equalToConstant: 34),
            addDogButton.heightAnchor.constraint(equalToConstant: 34),
            addDogButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            addDogButton.centerYAnchor.constraint(equalTo: viewTitle.centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 30),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        
    }
    
}
