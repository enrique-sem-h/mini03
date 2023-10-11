//
//  ListViewModel.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 28/09/23.
//

import Foundation

class ListViewModel {
    
    let dogManager = DogManager.shared
    
    var dogs: [Dog] {
        dogManager.dogs
    }
    
    weak var listViewController: ListViewController?

    func fetchDogs() {
//        self.dogs = dogManager.fetch()
        listViewController?.listView.tableView.reloadData()
    }
    
    func showAddDogView(dog: Dog?) {
        let vc = AddDogViewController(with: dog)
        vc.listViewController = listViewController
    
        listViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
