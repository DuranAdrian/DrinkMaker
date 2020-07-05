//
//  IngredientCell.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/19/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class IngredientCell: UITableViewCell {
    @IBOutlet weak var bulletView: UIView!
    @IBOutlet weak var Ingredient: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        setUpCell()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        setUpCell()
    }
    
    func setUpCell() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        bulletView.layer.cornerRadius = bulletView.frame.width / 2.0
        bulletView.layer.masksToBounds = true
        Ingredient.font = UIFont.init(name: "Lato-Regular", size: 17.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
