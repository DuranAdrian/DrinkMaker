//
//  HomeCell1.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/26/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class HomeCell1: UICollectionViewCell {
    var nameLabel: UILabel! = UILabel()
    var categoryLabel: UILabel! = UILabel()
    var drinkImage: UIImageView! = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func commonInit() {
        backgroundColor = UIColor.CustomBackgroundColor.dark
        layer.borderColor = UIColor.CustomBackgroundColor.darkGray.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 20.0
        layer.masksToBounds = true
        
        // Set image on right side
        drinkImage.translatesAutoresizingMaskIntoConstraints = false
        drinkImage.backgroundColor = backgroundColor
        drinkImage.contentMode = .scaleAspectFill
        drinkImage.layer.masksToBounds = true
//        drinkImage.layer.cornerRadius =  10.0
        print("HOMECELL1 DRINKIMAGE FRAME: \(frame)")
        addSubview(drinkImage)

//        drinkImage.layer.borderColor = UIColor.CustomBackgroundColor.darkGray.cgColor
        drinkImage.topAnchor.constraint(equalTo: topAnchor, constant: 0.0).isActive = true
        drinkImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0).isActive = true
        drinkImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0).isActive = true
        drinkImage.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
//        drinkImage.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        // Add Dark Blur background to show white text
        let darkBlurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: darkBlurEffect)
        blurEffectView.frame = drinkImage.bounds
        blurEffectView.alpha = 0.5
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        drinkImage.addSubview(blurEffectView)
        blurEffectView.topAnchor.constraint(equalTo: drinkImage.topAnchor, constant: 0.0).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: drinkImage.bottomAnchor, constant: 0.0).isActive = true
        blurEffectView.leadingAnchor.constraint(equalTo: drinkImage.leadingAnchor, constant: 0.0).isActive = true
        blurEffectView.trailingAnchor.constraint(equalTo: drinkImage.trailingAnchor, constant: 0.0).isActive = true
        
        //Set Stack View
//        let detailStackView = UIStackView(frame: .zero)
//        detailStackView.axis = .horizontal
//        detailStackView.alignment = .leading
//        detailStackView.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(detailStackView)
//        detailStackView.topAnchor.constraint(equalTo: drinkImage.bottomAnchor, constant: 0.0).isActive = true
//        detailStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
//        detailStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0).isActive = true
//        detailStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0).isActive = true
        
        // Set Name Label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.init(name: "Lato-Regular", size: 20.0)
        nameLabel.setContentHuggingPriority(.init(250), for: .horizontal)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.numberOfLines = 0
        addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
//        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0).isActive = true
        
        // Set categoryLabel
        categoryLabel.text = "Ordinary"
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.font = UIFont.init(name: "Lato-Regular", size: 13.0)
        categoryLabel.setContentHuggingPriority(.init(251), for: .horizontal)
        categoryLabel.adjustsFontSizeToFitWidth = true
        categoryLabel.numberOfLines = 0
        addSubview(categoryLabel)
        categoryLabel.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0.0).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10.0).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0).isActive = true
        
    }
}
