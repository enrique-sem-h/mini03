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
        let navC = UINavigationController(rootViewController: vc)
        
        if let sheet = navC.sheetPresentationController {
            sheet.preferredCornerRadius = 12
            sheet.detents = [.large()]
        }
        
        listViewController?.navigationController?.present(navC, animated: true)
    }
}
