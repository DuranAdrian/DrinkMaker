//
//  SearchButton.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/28/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

@IBDesignable
class SearchButton: UIButton {
    // Designable Variables
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            refreshBorder(value: borderWidth)
        }
    }
    
    @IBInspectable var borderColor: UIColor = .red {
        didSet {
            refreshBorderColor(value: borderColor)
        }
    }
    
    
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    func refreshBorder(value: CGFloat) {
        layer.borderWidth = value
    }
    
    func refreshBorderColor(value: UIColor) {
        layer.borderColor = value.cgColor
    }
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        // Common logic goes here
        refreshCorners(value: cornerRadius)
    }
    
    


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
