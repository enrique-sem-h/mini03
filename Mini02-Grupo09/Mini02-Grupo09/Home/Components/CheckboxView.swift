//
//  CheckboxView.swift
//  testeLista
//
//  Created by Gabriel Eduardo on 27/09/23.
//

import Foundation
import UIKit

class Checkbox: UIControl {

    private weak var imageView: UIImageView!
    
    private var image: UIImage {
        return checked ? UIImage(systemName: "checkmark.circle.fill")! : UIImage(systemName: "circle")!
    }
    
    public var checked:Bool = false {
        didSet {
            imageView.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor)
        ])
                
        imageView.image = UIImage(systemName: "circle")
        imageView.contentMode = .scaleAspectFit
        
        self.imageView = imageView
        
        backgroundColor = UIColor.clear
        
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    @objc func touchUpInside() {
        checked.toggle()
        sendActions(for: .valueChanged)
    }

}
