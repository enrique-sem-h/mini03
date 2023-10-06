//
//  ListViewModel.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 28/09/23.
//

import Foundation
import UIKit

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomCell(reuseIdentifier: "cell", dog: dogManager.dogs[indexPath.row])
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.dog = dogManager.dogs[indexPath.row]
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomCell else { return 130 }
//        return dogManager.dogs.isOpened ? 400 : 130
        return cell.isOpened ? 400 : 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogManager.dogs.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomCell else { return }
        
        cell.chevronImage.image = UIImage(systemName: cell.isOpened ? "chevron.down" : "chevron.right")
        cell.isOpened.toggle()
        
        tableView.reloadRows(at: [selectedIndex], with: .none)
    }
}
