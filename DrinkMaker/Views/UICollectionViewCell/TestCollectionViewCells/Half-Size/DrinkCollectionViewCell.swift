//
//  DrinkCollectionViewCell.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/25/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

// Cell Example 4
class DrinkCollectionViewCell: UICollectionViewCell {
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
    
    func commonInit() {
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
        drinkImage.layer.cornerRadius =  10.0
        print("DRINKIMAGE FRAME: \(frame)")
        addSubview(drinkImage)

        drinkImage.layer.borderColor = UIColor.CustomBackgroundColor.darkGray.cgColor
        drinkImage.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        drinkImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0).isActive = true
        drinkImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        drinkImage.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        // Set categoryLabel
        categoryLabel.text = "Ordinary"
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.font = UIFont.init(name: "Lato-Regular", size: 14.0)
        categoryLabel.adjustsFontSizeToFitWidth = true
        categoryLabel.numberOfLines = 0
        addSubview(categoryLabel)
        categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0).isActive = true
        
        // Set Name Label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.init(name: "Lato-Regular", size: 20.0)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.numberOfLines = 0
        addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor, constant: 0.0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: drinkImage.leadingAnchor, constant: -10.0).isActive = true
        
    }
}
