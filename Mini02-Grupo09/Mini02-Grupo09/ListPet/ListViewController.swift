
import UIKit

class ListViewController: UIViewController {
    
    @objc func editButtonTapped() {
        let editViewController = EditViewController() // Substitua EditViewController pelo nome real da sua EditView
        navigationController?.pushViewController(editViewController, animated: true)
    }
    
    var dogManager = DogManager()

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
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomCell(reuseIdentifier: "cell", dog: dogManager.dogs[indexPath.row])
        
        cell.dog = dogManager.dogs[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomCell else { return 130 }
//        return dogManager.dogs.isOpened ? 400 : 130
        return cell.isOpened ? 130 : 400
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
