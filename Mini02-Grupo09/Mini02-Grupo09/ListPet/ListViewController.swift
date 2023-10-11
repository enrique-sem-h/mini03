import UIKit

class ListViewController: UIViewController {

    var selectedIndex: IndexPath?
    
    let listView = ListView()
    let listViewModel = ListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = listView
        
        setupNavigationBar()
        setupTableView()
        
        listViewModel.listViewController = self
        listViewModel.fetchDogs()
    }
    
    private func setupNavigationBar() {
        let image = UIImage(systemName: "plus.circle.fill")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showAddDogView))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc
    private func showAddDogView() {
        listViewModel.showAddDogView(dog: nil)
    }
    
    private func setupTableView() {
        listView.tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        listView.tableView.delegate = self
        listView.tableView.dataSource = self
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomCell else { return }
        
        if let selectedIndex = selectedIndex {
            
            if selectedIndex == indexPath {
                
                self.selectedIndex = nil
                
                tableView.reloadRows(at: [indexPath], with: .none)
                
            } else {
                
                let oldSelectedIndex = selectedIndex
                
                self.selectedIndex = indexPath
                
                tableView.reloadRows(at: [indexPath,oldSelectedIndex], with: .none)
            }
            
        } else {
            
            self.selectedIndex = indexPath
            
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomCell else { return 130 }
        
        if selectedIndex == indexPath {
            UIView.animate(withDuration: 0.3) {
                cell.button.isHidden = true
            }
            return 400
        } else {
            return 130
        }
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dog = listViewModel.dogs[indexPath.row]
        let cell = CustomCell(dog: dog)
        
        if selectedIndex == indexPath {
            
            cell.chevronImage.image = UIImage(systemName: "chevron.down")
            
        } else {
            
            cell.chevronImage.image = UIImage(systemName: "chevron.right")
        }
        
        cell.editButtonCallback = { [weak self] in
            self?.listViewModel.showAddDogView(dog: dog)
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.dogs.count
    }
}
