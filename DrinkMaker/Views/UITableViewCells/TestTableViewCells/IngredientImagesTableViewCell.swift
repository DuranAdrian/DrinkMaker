//
//  IngredientImagesTableViewCell.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/24/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class IngredientImagesTableViewCell: UITableViewCell {
    var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 5.0, left: 20.0, bottom: 5.0, right: 20.0)
        flowLayout.minimumInteritemSpacing = 10.0
        flowLayout.minimumLineSpacing = 25.0
        flowLayout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor.CustomBackgroundColor.light
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    var ingredientCount: Int = 0
    var ingredientNames: [String] = []
    var ingredientImages: [UIImage] = []
    
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
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        selectionStyle = .none
        backgroundColor = .clear
        collectionView.register(IngredientRoundedImageCollectionCell.self, forCellWithReuseIdentifier: "IngredientRoundedImageCollectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0.0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        collectionView.layoutIfNeeded()
        return collectionView.collectionViewLayout.collectionViewContentSize
    }
}

extension IngredientImagesTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredientImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IngredientRoundedImageCollectionCell", for: indexPath) as? IngredientRoundedImageCollectionCell else {
            print("Error")
            return UICollectionViewCell() }
        cell.imageView.image = ingredientImages[indexPath.row]
//        NetworkManager().ingredients.getMediumIngredientImage(ingredientName: ingredientNames[indexPath.row], completion: { image, error in
//            if let error = error {
//                cell.imageView.image = UIImage(named: "Cocktail-Placeholder")
//            }
//            if let image = image {
//                cell.imageView.image = image
//            }
//        })
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
    }
    
    
}
