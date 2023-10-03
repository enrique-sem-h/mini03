//
//  ListViewModel.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 28/09/23.
//

import Foundation
import UIKit

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return data[indexPath.row].isOpened ? 400 : 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = data[indexPath.row]
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CustomCell{
            cell.chevronImage.image = UIImage(systemName: cell.data!.isOpened ? "chevron.down" : "chevron.right")
        }
        
        data[indexPath.row].isOpened.toggle()
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [selectedIndex], with: .none)
        tableView.endUpdates()
    }
    
    
    
    
}
