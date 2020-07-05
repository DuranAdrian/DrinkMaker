//
//  DrinkView.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/19/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit
import FontAwesome_swift

class DrinkView: UIView {
    let cellHeight: CGFloat = 44.0
    
    // Add Scroll View
    var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // Add ImageView
    var drinkImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .darkGray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "Margarita")
        imageView.layer.cornerRadius = 20.0
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    // Add Drink Name Label with font awesome drink in red indicting alcohol or not
    var drinkNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
//        label.attributedText = NSAttributedString(string: "Margarita", attributes: nameAttributes)
        label.font = UIFont.init(name: "Lato-Regular", size: 20.0)
        label.text = "Margarita"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Add Category and Tags
    // Add Ingredients Table View with Modified List of Combined Ingredients with Measurements
    var ingredientTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.isUserInteractionEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorInset = .zero
        tableView.separatorColor = .clear
        return tableView
    }()
    // Add Instructions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpView() {
        // SCROLL VIEW
        addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0.0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0).isActive = true
        scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: 0.0).isActive = true
        scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: 0.0).isActive = true
        
        // ImageView
        scrollView.addSubview(drinkImageView)
        drinkImageView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 20.0).isActive = true
        drinkImageView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        drinkImageView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
        drinkImageView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        
        // Name Label
        scrollView.addSubview(drinkNameLabel)
        drinkNameLabel.topAnchor.constraint(equalTo: drinkImageView.bottomAnchor, constant: 10.0).isActive = true
        drinkNameLabel.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        drinkNameLabel.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
        
        // Ingredients
        let ingredientTitleLabel = UILabel(frame: .zero)
        ingredientTitleLabel.text = "Ingredients"
        ingredientTitleLabel.font = UIFont.init(name: "Lato-Bold", size: 17.0)
        ingredientTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(ingredientTitleLabel)
        ingredientTitleLabel.topAnchor.constraint(equalTo: drinkNameLabel.bottomAnchor, constant: 10.0).isActive = true
        ingredientTitleLabel.leadingAnchor.constraint(equalTo: drinkNameLabel.leadingAnchor, constant: 0.0).isActive = true
        ingredientTitleLabel.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
        
        scrollView.addSubview(ingredientTableView)
        ingredientTableView.topAnchor.constraint(equalTo: ingredientTitleLabel.bottomAnchor, constant: 5.0).isActive = true
        ingredientTableView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        ingredientTableView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
//        ingredientTableView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: 500.0).isActive = true
        ingredientTableView.heightAnchor.constraint(equalToConstant: 7*(cellHeight)).isActive = true
//        ingredientTableView.widthAnchor.constraint(equalTo: scrollView.contentLayoutGuide.widthAnchor, constant: -40.0).isActive = true
        
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: ingredientTableView.bottomAnchor, constant: 0.0).isActive = true
        
    }
    
    func modifyNameLabel() {
        let nameAttributes = [NSAttributedString.Key.font: UIFont.init(name: "Lato-Regular", size: 20.0), NSAttributedString.Key.foregroundColor: UIColor.black]
        let hypenAttributes = [NSAttributedString.Key.font: UIFont.init(name: "Lato-Regular", size: 17.0), NSAttributedString.Key.foregroundColor: UIColor.black]
        let drinkIconAttributes = [NSAttributedString.Key.font: UIFont.fontAwesome(ofSize: 20.0, style: .solid), NSAttributedString.Key.foregroundColor: UIColor.red]
        
        let nameAttributedString = NSMutableAttributedString(string: "Margarita", attributes: nameAttributes)
        let hypenAttributedString = NSMutableAttributedString(string: " - ", attributes: hypenAttributes)
        let drinkIcon = NSMutableAttributedString(string: String.fontAwesomeIcon(name: .cocktail), attributes: drinkIconAttributes)
        let combinedText: NSMutableAttributedString = nameAttributedString
        combinedText.append(hypenAttributedString)
        combinedText.append(drinkIcon)
        drinkNameLabel.attributedText = combinedText
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
