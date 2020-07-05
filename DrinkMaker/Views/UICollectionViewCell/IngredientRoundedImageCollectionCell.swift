//
//  IngredientRoundedImageCollectionCell.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/24/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class IngredientRoundedImageCollectionCell: UICollectionViewCell {
    var imageView: UIImageView = {
        var view = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 75.0, height: 75.0))
        view.layer.cornerRadius = view.frame.width / 2.0
        view.layer.masksToBounds = true
        view.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2078431373, blue: 0.2, alpha: 1)
        view.layer.borderWidth = 1.0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
//        view.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.1411764706, blue: 0.137254902, alpha: 1)
        view.backgroundColor = .clear
        view.image = UIImage(named: "Ingredient-Placeholder")
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setUpView() {
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0.0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0).isActive = true
    }
}
