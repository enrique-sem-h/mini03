
import UIKit

class ListViewController: UIViewController {
    
    var data = [
        PetData(name: "Kalel", size: "Giant", age: "2", weight: "60"),
        PetData(name: "Rodrigo", size: "Mini", age: "1", weight: "5"),
        PetData(name: "Haguna", size: "Mini", age: "2", weight: "3")
    ]

    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    let tableView:UITableView = {
       let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        return tb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }


}
