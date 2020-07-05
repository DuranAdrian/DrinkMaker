//
//  SectionTitleView.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/19/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class SectionTitleView: UIView {
    var sectionTitle: String!
    
    init(title: String) {
        super.init(frame: .zero)
        sectionTitle = title
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpView() {
        let seperatorView = UIView(frame: .zero)
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.backgroundColor = UIColor.CustomBackgroundColor.darkGray
        addSubview(seperatorView)
        seperatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        seperatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0).isActive = true
        seperatorView.topAnchor.constraint(equalTo: topAnchor, constant: 0.0).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        backgroundColor = .clear
        let titleAttributes = [NSAttributedString.Key.font: UIFont.init(name: "Lato-Bold", size: 28.0), NSAttributedString.Key.foregroundColor: UIColor.TextColor.yellowText]
        let titleLabel = UILabel()
        titleLabel.attributedText = NSAttributedString(string: sectionTitle, attributes: titleAttributes)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0)
        ])
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
