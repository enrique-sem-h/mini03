
import UIKit

class ListViewController: UIViewController {
    
    var editButtonCallback: (() -> Void)?
    
    var dogManager = DogManager.shared

    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    let ttitle = UILabel()
    
    let tableView:UITableView = {
       let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        return tb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"), style: .plain, target: self, action: #selector(showAddDogView))
        navigationItem.rightBarButtonItem?.tintColor = .systemRed
    }
    
    @objc func showAddDogView(){
        let vc = AddDogViewController()
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        view.addSubview(ttitle)
        
        ttitle.translatesAutoresizingMaskIntoConstraints = false
        ttitle.text = String(localized: "List")
        ttitle.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        ttitle.textAlignment = .center
        ttitle.backgroundColor = .gray
        
        view.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            
            ttitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            ttitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            ttitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            ttitle.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 68),
            
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 90),
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
