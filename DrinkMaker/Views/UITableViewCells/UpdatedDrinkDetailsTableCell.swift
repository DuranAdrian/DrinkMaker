//
//  TestNewDetailCell.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/23/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

// TODO: Connect Share Button Action

import UIKit
import TagListView

class UpdatedDrinkDetailsTableCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var categoryTagsView: TagListView!
    @IBOutlet var tagLabel: UILabel!
    @IBOutlet var tagTagsView: TagListView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        commonInit()
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    
    func modifyNameLabel(with newName: String) {
        let nameAttributes = [NSAttributedString.Key.font: UIFont.init(name: "Lato-Bold", size: 26.0), NSAttributedString.Key.foregroundColor: UIColor.TextColor.lightText]
        let hypenAttributes = [NSAttributedString.Key.font: UIFont.init(name: "Lato-Regular", size: 17.0), NSAttributedString.Key.foregroundColor: UIColor.TextColor.lightText]
        let drinkIconAttributes = [NSAttributedString.Key.font: UIFont.fontAwesome(ofSize: 22.0, style: .solid), NSAttributedString.Key.foregroundColor: UIColor.red]
        
        let nameAttributedString = NSMutableAttributedString(string: newName, attributes: nameAttributes)
        let hypenAttributedString = NSMutableAttributedString(string: " - ", attributes: hypenAttributes)
        let drinkIcon = NSMutableAttributedString(string: String.fontAwesomeIcon(name: .cocktail), attributes: drinkIconAttributes)
        let combinedText: NSMutableAttributedString = nameAttributedString
        combinedText.append(hypenAttributedString)
        combinedText.append(drinkIcon)
        nameLabel.attributedText = combinedText
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
