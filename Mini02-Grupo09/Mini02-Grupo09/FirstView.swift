//
//  FirstView.swift
//  Mini02-Grupo09
//
//  Created by Enrique Carvalho on 22/09/23.
//

import UIKit

class FirstView: DayViewController {
    

    override func loadView() {
        calendar.timeZone = TimeZone(identifier: "Europe/Paris")!
        dayView = DayView(calendar: calendar)
        view = dayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "First Screen"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        self.view.backgroundColor = .systemRed
    }


}

