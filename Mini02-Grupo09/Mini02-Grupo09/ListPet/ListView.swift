//
//  ListView.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 06/10/23.
//

import Foundation
import UIKit

class ListView: UIView {
    
    let ttitle = UILabel()
    
    weak var listViewController: ListViewController?
    
    let tableView:UITableView = {
       let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        return tb
    }()
    
    func setupTableView() {
        self.addSubview(tableView)
        self.addSubview(ttitle)
        
        ttitle.translatesAutoresizingMaskIntoConstraints = false
        ttitle.text = String(localized: "List")
        ttitle.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        ttitle.textAlignment = .center
        ttitle.backgroundColor = .gray
        
        self.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            
            ttitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            ttitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            ttitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            ttitle.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 68),
            
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = listViewController
        tableView.dataSource = listViewController
    }
    
    init(){
        super.init(frame: .zero)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
