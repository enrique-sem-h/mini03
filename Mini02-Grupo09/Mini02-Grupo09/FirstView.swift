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
        self.view.backgroundColor = .systemRed
    }


}

