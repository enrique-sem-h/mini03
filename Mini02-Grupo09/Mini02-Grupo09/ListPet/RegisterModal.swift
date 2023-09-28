//
//  RegisterModal.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 27/09/23.
//

import Foundation

class Section {
    let title: String
    let options: [String]
    var isOpened = false
    
    init(title: String, options: [String], isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
    
    
}
