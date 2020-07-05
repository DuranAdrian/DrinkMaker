//
//  drinkPictureView.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/19/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class DrinkPictureView: UIView {
    let drinkImageView: UIImageView = { let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .darkGray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "Cocktail-Placeholder")
        imageView.layer.cornerRadius = 0.0
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(frame: CGRect, imageToDisplay: UIImage) {
        super.init(frame: frame)
        setUpView()
        drinkImageView.image = imageToDisplay
    }
    
    func setUpView() {
        let shadowContainer = UIView(frame: frame)
        shadowContainer.translatesAutoresizingMaskIntoConstraints = false
//        shadowContainer.layer.shadowColor = UIColor.gray.cgColor
//        shadowContainer.layer.shadowRadius = 15.0
//        shadowContainer.layer.shadowOpacity = 1.0
//        shadowContainer.layer.shadowOffset = .zero
//        shadowContainer.clipsToBounds = false
//        shadowContainer.layer.shadowPath = UIBezierPath(roundedRect: frame, cornerRadius: 25.0).cgPath
        addSubview(shadowContainer)
        shadowContainer.topAnchor.constraint(equalTo: topAnchor, constant: 0.0).isActive = true
        shadowContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0).isActive = true
        shadowContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0).isActive = true
        shadowContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0).isActive = true
        
        backgroundColor = .clear
        
        shadowContainer.addSubview(drinkImageView)
        drinkImageView.topAnchor.constraint(equalTo: shadowContainer.topAnchor, constant: 0.0).isActive = true
        drinkImageView.leadingAnchor.constraint(equalTo: shadowContainer.leadingAnchor, constant: 0.0).isActive = true
        drinkImageView.trailingAnchor.constraint(equalTo: shadowContainer.trailingAnchor, constant: 0.0).isActive = true
        drinkImageView.bottomAnchor.constraint(equalTo: shadowContainer.bottomAnchor, constant: 0.0).isActive = true
    }
    override func layoutSubviews() {
        
        super.layoutSubviews()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
