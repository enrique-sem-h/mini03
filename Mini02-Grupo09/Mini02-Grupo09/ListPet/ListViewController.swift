
import UIKit

class ListViewController: UIViewController {
    
    var editButtonCallback: (() -> Void)?
    
    var dogManager = DogManager.shared

    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    let listView = ListView()
    
    var listViewModel = ListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        listView.listViewController = self
        listViewModel.listViewController = self
        self.view = listView
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"), style: .plain, target: self, action: #selector(showAddDogView))
        navigationItem.rightBarButtonItem?.tintColor = .systemRed
    }
    
    @objc func showAddDogView(){
        listViewModel.showAddDogView()
    }


}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomCell(reuseIdentifier: "cell", dog: dogManager.dogs[indexPath.row], listViewController: self)
        
        cell.dog = dogManager.dogs[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomCell else { return 130 }
//        return cell.isOpened ? 130 : 400
        if cell.isOpened{
            UIView.animate(withDuration: 0.3) {
                cell.button.isHidden = true
            }
            return 130
        } else {
            return 400
        }
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
