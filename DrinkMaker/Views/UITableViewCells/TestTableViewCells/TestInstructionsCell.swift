//
//  TestInstructionsCell.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/19/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class TestInstructionsCell: UITableViewCell {
    var instructionLabel: UILabel = {
       let label = UILabel()
        label.text = "Instructions"
        label.font = UIFont.init(name: "Lato-Regular", size: 17.0)
        label.textColor = #colorLiteral(red: 0.9098039216, green: 0.9294117647, blue: 0.8745098039, alpha: 1)
        label.numberOfLines = 0
//        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var serveLabel: UILabel = {
        let label = UILabel()
        label.text = "Serve"
        label.textColor = #colorLiteral(red: 0.9098039216, green: 0.9294117647, blue: 0.8745098039, alpha: 1)
        label.font = UIFont.init(name: "Lato-Regular", size: 17.0)
        label.numberOfLines = 0
//        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpCell()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCell()
    }
    
    func setUpCell() {
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(instructionLabel)
        instructionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5.0).isActive = true
        instructionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        instructionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0).isActive = true
        
        addSubview(serveLabel)
        serveLabel.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 5.0).isActive = true
        serveLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        serveLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0).isActive = true
        serveLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50.0).isActive = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
