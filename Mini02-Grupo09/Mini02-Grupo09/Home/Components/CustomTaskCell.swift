//
//  TableView.swift
//  testeLista
//
//  Created by Gabriel Eduardo on 26/09/23.
//

import Foundation
import UIKit

class CustomTaskCell: UITableViewCell {
    let hourLabel: UILabel = {
        let hourLabel = UILabel()
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
        hourLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return hourLabel
    }()
    let iconCircle: UIView = {
        let iconCircle = UIView()
        iconCircle.backgroundColor = UIColor.blue
        iconCircle.layer.cornerRadius = 21
        iconCircle.clipsToBounds = true
        iconCircle.translatesAutoresizingMaskIntoConstraints = false
        return iconCircle
    }()
    let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return titleLabel
    }()
    let check = Checkbox()
    
    let tasksManager = TasksManager.shared
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, date: Date, icon: Data, taskTitle: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.hourLabel.text = formattedDate(date: date)
        self.iconView.image = UIImage(data: icon)
        self.titleLabel.text = taskTitle
    }
    
    func setup() {
        // Configuração da label do horário
        contentView.addSubview(hourLabel)
        
        // Configuração da label do ícone
        contentView.addSubview(iconCircle)
        iconCircle.addSubview(iconView)
        
        // Configuração da label do título
        contentView.addSubview(titleLabel)
        
        // Configuração do check
        check.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(check)
        check.addTarget(self, action: #selector(updateTitleLabel), for: .valueChanged)
        
        NSLayoutConstraint.activate([
//            // Constraints do horário
//            hourLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
//            hourLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            
//            // Constraints do ícone
//            iconCircle.leadingAnchor.constraint(equalTo: hourLabel.trailingAnchor, constant: 10),
//            iconCircle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            iconCircle.widthAnchor.constraint(equalToConstant: 42),
//            iconCircle.heightAnchor.constraint(equalToConstant: 42),
//            iconView.leadingAnchor.constraint(equalTo: iconCircle.leadingAnchor),
//            iconView.trailingAnchor.constraint(equalTo: iconCircle.trailingAnchor),
//            iconView.topAnchor.constraint(equalTo: iconCircle.topAnchor),
//            iconView.bottomAnchor.constraint(equalTo: iconCircle.bottomAnchor),
//            
//            // Constraints do título
//            titleLabel.leadingAnchor.constraint(equalTo: iconCircle.trailingAnchor, constant: 8),
//            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            
//            // Constraints do check
//            check.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
//            check.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            
//            // Constraints da célula
//            contentView.heightAnchor.constraint(equalToConstant: 126) // Altura de cada célula
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)

        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func formattedDate(date: Date) -> String {
            let timezone = Calendar.autoupdatingCurrent.timeZone
            let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            formatter.timeZone = timezone
            formatter.locale = Locale.init(identifier: Locale.preferredLanguages[0])
            return formatter.string(from: date)
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
