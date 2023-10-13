//
//  TableView.swift
//  testeLista
//
//  Created by Gabriel Eduardo on 26/09/23.
//

import Foundation
import UIKit

class CustomTaskCell: UITableViewCell {
    let task: DogTask?
    
    let hourLabel: UILabel = {
        let hourLabel = UILabel()
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
        hourLabel.font = UIFont(name: "Animal-Bold", size: 16)
        return hourLabel
    }()
    let iconCircle: UIView = {
        let iconCircle = UIView()
        iconCircle.backgroundColor = UIColor(named: "Yellow")
        iconCircle.layer.cornerRadius = 23 // Metade do tamanho do círculo
        iconCircle.clipsToBounds = true
        iconCircle.translatesAutoresizingMaskIntoConstraints = false
        return iconCircle
    }()
    let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont(name: "Animal-Regular", size: 18)
        return titleLabel
    }()
    let check = Checkbox()
    
    let tasksManager = TasksManager.shared
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, task: DogTask) {
        self.task = task
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.hourLabel.text = formattedDate(date: task.date!)
        self.iconView.image = UIImage(data: task.icon!)
        self.titleLabel.text = task.title
        
        setup()
    }
    
    func setup() {
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        
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
            // Constraints do horário
            hourLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            hourLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // Constraints do ícone
            iconCircle.leadingAnchor.constraint(equalTo: hourLabel.trailingAnchor, constant: 12),
            iconCircle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconCircle.widthAnchor.constraint(equalToConstant: 46),
            iconCircle.heightAnchor.constraint(equalToConstant: 46),
            iconView.leadingAnchor.constraint(equalTo: iconCircle.leadingAnchor),
            iconView.trailingAnchor.constraint(equalTo: iconCircle.trailingAnchor),
            iconView.topAnchor.constraint(equalTo: iconCircle.topAnchor),
            iconView.bottomAnchor.constraint(equalTo: iconCircle.bottomAnchor),
            
            // Constraints do título
            titleLabel.leadingAnchor.constraint(equalTo: iconCircle.trailingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: check.leadingAnchor, constant: 24),
            
            // Constraints do check
            check.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            check.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            
            // Constraints da célula
            contentView.heightAnchor.constraint(equalToConstant: 126) // Altura de cada célula
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
