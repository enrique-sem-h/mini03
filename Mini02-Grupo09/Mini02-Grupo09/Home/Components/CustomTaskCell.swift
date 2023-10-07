//
//  TableView.swift
//  testeLista
//
//  Created by Gabriel Eduardo on 26/09/23.
//

import Foundation
import UIKit

class CustomTaskCell: UITableViewCell {
    let hourLabel = UILabel()
    let iconImage = UIView()
    let titleLabel = UILabel()
    let check = Checkbox()
    
    let tasksManager = TasksManager.shared

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            // Configuração da label do horário
            hourLabel.text = "18:00"
            hourLabel.translatesAutoresizingMaskIntoConstraints = false
            hourLabel.font = hourLabel.font.withSize(12)
            contentView.addSubview(hourLabel)
            
            // Configuração da label do ícone (Necessita de alteração pós asset)
            iconImage.backgroundColor = UIColor.blue
            iconImage.layer.cornerRadius = 21
            iconImage.clipsToBounds = true
            iconImage.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(iconImage)
            
            // Configuração da label do título
            titleLabel.text = "Alimentando o Thor"
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.font = titleLabel.font.withSize(12)
            contentView.addSubview(titleLabel)
            
            // Configuração do check
            check.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(check)
            check.addTarget(self, action: #selector(updateTitleLabel), for: .valueChanged)
            
            NSLayoutConstraint.activate([
                // Constraints do horário
                hourLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
                hourLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                
                // Constraints do ícone
                iconImage.leadingAnchor.constraint(equalTo: hourLabel.trailingAnchor, constant: 10),
                iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                iconImage.widthAnchor.constraint(equalToConstant: 42), // Necessita de alteração pós asset
                iconImage.heightAnchor.constraint(equalToConstant: 42), // Necessita de alteração pós asset
                
                // Constraints do título
                titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 8),
                titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                
                // Constraints do check
                check.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
                check.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                
                // Constraints da célula
                contentView.heightAnchor.constraint(equalToConstant: 126) // Altura de cada célula
            ])
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    // ------------------- FUNÇÕES -------------------
    
    // Essa função atualiza o título quando o check é marcado
    @objc private func updateTitleLabel() {
        let attributedString = NSMutableAttributedString(string: titleLabel.text!)
        
        if check.checked {
            attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length - 1))
            attributedString.addAttribute(.foregroundColor, value: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5), range: NSMakeRange(0, attributedString.length))
        } else {
            attributedString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributedString.length - 1))
            attributedString.removeAttribute(.foregroundColor, range: NSMakeRange(0, attributedString.length))
        }

        titleLabel.attributedText = attributedString
    }
}
// ------------------- FIM DA CÉLULA DA TAREFA CUSTOMIZADA -------------------
