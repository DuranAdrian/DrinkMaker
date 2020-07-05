//
//  SectionCollectionHeaderReusableView.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/25/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class SectionCollectionHeaderReusableView: UICollectionReusableView {
    let titleLabel = UILabel()
    var sectionTitle: String! = "Section Title"
    var displayButton: UIButton! = UIButton(frame: .zero)
    var isOpen: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    
    init(title: String) {
        super.init(frame: .zero)
        sectionTitle = title
        setUpView()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setUpView()
    }

    fileprivate func setUpView() {
        backgroundColor = .clear
        let titleAttributes = [NSAttributedString.Key.font: UIFont.init(name: "Lato-Bold", size: 28.0), NSAttributedString.Key.foregroundColor: UIColor.TextColor.yellowText]
//        let titleLabel = UILabel()
        titleLabel.attributedText = NSAttributedString(string: sectionTitle, attributes: titleAttributes)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0)
        ])
        
        
        displayButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        displayButton.translatesAutoresizingMaskIntoConstraints = false
        displayButton.tintColor = UIColor.CustomBackgroundColor.darkGray
//        displayButton.backgroundColor = .green
        addSubview(displayButton)
        displayButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0.0).isActive = true
        displayButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0).isActive = true
        displayButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        displayButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        
    }

}
