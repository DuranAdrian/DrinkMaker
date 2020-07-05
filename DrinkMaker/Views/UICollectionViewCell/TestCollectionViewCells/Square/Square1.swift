//
//  Square1.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/27/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class Square1: UICollectionViewCell {
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
    
    fileprivate func commonInit() {
        backgroundColor = UIColor.CustomBackgroundColor.dark
        layer.borderColor = UIColor.CustomBackgroundColor.darkGray.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 20.0
        layer.masksToBounds = true
    }
}
