//
//  FirstView.swift
//  Mini02-Grupo09
//
//  Created by Enrique Carvalho on 22/09/23.
//

import UIKit

class FirstView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        test()
    }

    func test(){
        let button = UIButton()
        button.configuration = .borderless()
        button.configuration?.title = "click"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToView), for: .touchDown)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    @objc func goToView(){
        let navC = UINavigationController(rootViewController: AddDogViewController())
        navC.sheetPresentationController
        navigationController?.present(navC, animated: true)
    }
}

