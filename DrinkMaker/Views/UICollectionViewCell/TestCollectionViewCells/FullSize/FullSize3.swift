//
//  FullSize3.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/27/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class FullSize3: UICollectionViewCell {
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
        
        // set image to take up all background
        drinkImage.translatesAutoresizingMaskIntoConstraints = false
        drinkImage.contentMode = .scaleAspectFill
        drinkImage.layer.masksToBounds = true
//        drinkImage.layer.cornerRadius = 40.0
        
        contentView.addSubview(drinkImage)
        drinkImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0).isActive = true
        drinkImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0).isActive = true
        drinkImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.0).isActive = true
        drinkImage.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
        
        // Add Dark Blur background to show white text
        let darkBlurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: darkBlurEffect)
        blurEffectView.alpha = 0.5
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        drinkImage.addSubview(blurEffectView)
        
        blurEffectView.topAnchor.constraint(equalTo: drinkImage.topAnchor, constant: 0.0).isActive = true
        blurEffectView.leadingAnchor.constraint(equalTo: drinkImage.leadingAnchor, constant: 0.0).isActive = true
        blurEffectView.trailingAnchor.constraint(equalTo: drinkImage.trailingAnchor, constant: 0.0).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: drinkImage.bottomAnchor).isActive = true
        
        // Set Name Label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.init(name: "Lato-Bold", size: 24.0)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.numberOfLines = 0
        drinkImage.addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: drinkImage.bottomAnchor, constant: -10.0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: drinkImage.leadingAnchor, constant: 10.0).isActive = true
        nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: drinkImage.trailingAnchor, constant: -10.0).isActive = true
        
        let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: 25.0))
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .clear
        addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: drinkImage.bottomAnchor, constant: 0.0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0).isActive = true
        
        // Category Label
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.font = UIFont.init(name: "Lato-Regular", size: 14.0)
        categoryLabel.adjustsFontSizeToFitWidth = true
        categoryLabel.numberOfLines = 0
        containerView.addSubview(categoryLabel)
        categoryLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
//        categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
//        categoryLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -10.0).isActive = true
        
        // View Receipe Label
        let viewReceipeLabel = UILabel()
        viewReceipeLabel.translatesAutoresizingMaskIntoConstraints = false
        viewReceipeLabel.font = UIFont.init(name: "Lato-Regular", size: 14.0)
        viewReceipeLabel.adjustsFontSizeToFitWidth = true
        viewReceipeLabel.text = "View Receipe"
        viewReceipeLabel.textColor = UIColor.red
        viewReceipeLabel.numberOfLines = 1
        containerView.addSubview(viewReceipeLabel)
        viewReceipeLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
//        categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        viewReceipeLabel.leadingAnchor.constraint(equalTo: categoryLabel.trailingAnchor, constant: 0.0).isActive = true
        viewReceipeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0).isActive = true
        
        
    }
    
}
