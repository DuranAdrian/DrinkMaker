//
//  UIView+Ext.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/25/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

extension UIView {
    func addColorGradient(firstColor: UIColor, secondColor: UIColor) {
        backgroundColor = .clear
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
