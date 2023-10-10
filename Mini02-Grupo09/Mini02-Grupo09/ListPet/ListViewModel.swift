//
//  ListViewModel.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 28/09/23.
//

import Foundation
import UIKit


class ListViewModel {
    
    var dogs: [Dog] = []
    weak var listViewController: ListViewController?

    func fetchDogs() {
        
        self.dogs = DogManager.shared.fetch()
        listViewController?.listView.tableView.reloadData()
    }
    
    func showAddDogView(){
        let vc = AddDogViewController()
        listViewController?.navigationController?.navigationBar.isHidden = true
        listViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
