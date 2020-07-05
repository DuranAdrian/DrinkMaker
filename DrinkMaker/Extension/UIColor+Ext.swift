//
//  UIColor+Ext.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/19/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit
extension UIColor {
    struct CustomBackgroundColor {
        static let light = #colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1)
        static let dark = #colorLiteral(red: 0.1411764706, green: 0.1411764706, blue: 0.137254902, alpha: 1)
        static let darkGray = #colorLiteral(red: 0.2, green: 0.2078431373, blue: 0.2, alpha: 1)
        static let yellow = #colorLiteral(red: 0.9607843137, green: 0.7960784314, blue: 0.3607843137, alpha: 1)
    }
    
    struct TextColor {
        static let darkText = #colorLiteral(red: 0.431372549, green: 0.431372549, blue: 0.431372549, alpha: 1)
        static let lightText = #colorLiteral(red: 0.9098039216, green: 0.9294117647, blue: 0.8745098039, alpha: 1)
        static let lightBlueText = #colorLiteral(red: 0.8117647059, green: 0.8588235294, blue: 0.8352941176, alpha: 1)
        static let yellowText = #colorLiteral(red: 0.9607843137, green: 0.7960784314, blue: 0.3607843137, alpha: 1)
    }
}
