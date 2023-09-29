//
//  CustomCell.swift
//  Mini02-Grupo09
//
//  Created by GABRIEL Ferreira Cardoso on 28/09/23.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var data: PetData? {
        didSet {
            guard let data = data else { return }
            self.title.text = data.title
            self.desc.text = data.description
        }
    }
    
    var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "hmm course title here"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var desc: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "pro ios course at maxcodes.io/courses"
        label.textColor = .white
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var myImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "camera.circle.fill")
        iv.tintColor = .label
        return iv
    }()
    
    var container: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.backgroundColor = UIColor.darkGray
        v.layer.cornerRadius = 8
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(container)
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        
        container.addSubview(myImageView)
        container.addSubview(title)
        container.addSubview(desc)
        
        
        title.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 4).isActive = true
        title.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -4).isActive = true
        title.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        desc.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        desc.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 4).isActive = true
        desc.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -4).isActive = true
        desc.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
