//
//  HomeCell2.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/26/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class HomeCell2: UICollectionViewCell {
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
        
        // Add Dark Blur background to show white text
        let darkBlurEffect = UIBlurEffect(style: .dark)
        
        let blurEffectView = UIVisualEffectView(effect: darkBlurEffect)
        blurEffectView.frame = drinkImage.bounds
        contentView.addSubview(blurEffectView)
        
        // set image to take up all background
        drinkImage.translatesAutoresizingMaskIntoConstraints = false
        drinkImage.contentMode = .scaleAspectFit
        drinkImage.layer.masksToBounds = true
        drinkImage.layer.cornerRadius = 40.0
        print(drinkImage.frame.width)
        
        contentView.addSubview(drinkImage)
        drinkImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0.0).isActive = true
        drinkImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
        drinkImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        drinkImage.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        
        // Set AlcoholLabel
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
