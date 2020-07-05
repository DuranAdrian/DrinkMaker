
//
//  HomeCell4.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/26/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class HomeCell3: UICollectionViewCell {
    @IBOutlet var nameLabel: UILabel! = UILabel()
    @IBOutlet var categoryLabel: UILabel! = UILabel()
    @IBOutlet var drinkImage: UIImageView! = UIImageView(frame: .zero)

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
        
        // set image to take up all background
//        drinkImage.translatesAutoresizingMaskIntoConstraints = false
//        drinkImage.contentMode = .scaleAspectFit
//        drinkImage.layer.masksToBounds = true
//        drinkImage.bounds = contentView.bounds
//        contentView.addSubview(drinkImage)
////
//        drinkImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0).isActive = true
//        drinkImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.0).isActive = true
//        drinkImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0).isActive = true
//        drinkImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0.0).isActive = true
        
        // Add Dark Blur background to show white text
//        let darkBlurEffect = UIBlurEffect(style: .dark)
//
//        let blurEffectView = UIVisualEffectView(effect: darkBlurEffect)
//        blurEffectView.frame = drinkImage.bounds
//        contentView.addSubview(blurEffectView)

        
    }
    
}
