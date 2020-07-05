 //
//  HomeCollectionViewController.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/25/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var sectionTitles:[String] = ["Half Sized", "Full Size", "Square"]
    var sectionIsOpened:[Bool] = [true, true, true]
    var image: UIImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        NetworkManager().drinks.getRegularDrinkImage(imageUrl: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg", completion: { image, error in
            if let _ = error {
                self.image = UIImage(named: "Cocktail-Placeholder")!
            }
            if let image = image {
                self.image = image
            }
        })
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func setUpCollectionView() {
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.sectionHeadersPinToVisibleBounds = true
//        flowLayout.headerReferenceSize = CGSize(width: collectionView.frame.width, height: 50.0)
//        flowLayout.itemSize = CGSize(width: 50.0, height: 100.0)
//        flowLayout.estimatedItemSize = CGSize(width: 1.0, height: 1.0)
//        flowLayout.minimumLineSpacing = 10.0
//        flowLayout.minimumInteritemSpacing = 10.0
//        collectionView.collectionViewLayout = flowLayout
        collectionView.contentInset = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
        
        collectionView.backgroundColor = UIColor.CustomBackgroundColor.dark
        collectionView.register(SectionCollectionHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader")
        // Cell Example 4
        collectionView.register(DrinkCollectionViewCell.self, forCellWithReuseIdentifier: "DrinkCollectionViewCell")
        
        // Cell Example 3
//        collectionView.register(HomeCell3.self, forCellWithReuseIdentifier: "HomeCell3")
        collectionView.register(UINib.init(nibName: "HomeCell3", bundle: nil), forCellWithReuseIdentifier: "HomeCell3")
        collectionView.register(HomeCell2.self, forCellWithReuseIdentifier: "HomeCell2")
        collectionView.register(HomeCell1.self, forCellWithReuseIdentifier: "HomeCell1")
        
        // Full Size Cells
        collectionView.register(FullSize1.self, forCellWithReuseIdentifier: "FullSize1")
        collectionView.register(FullSize2.self, forCellWithReuseIdentifier: "FullSize2")
        collectionView.register(FullSize3.self, forCellWithReuseIdentifier: "FullSize3")
        
        // Square Cells
        collectionView.register(UINib.init(nibName: "Square1", bundle: nil), forCellWithReuseIdentifier: "Square1")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0 {
            if sectionIsOpened[section] {
                return 4
            }
        }
        if section == 1 {
            if sectionIsOpened[section] {
                return 3
            }
        }
        if section == 2 {
            if sectionIsOpened[section] {
                return 1
            }
        }
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView: UICollectionReusableView? = nil
        // Create Section Header
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionCollectionHeaderReusableView
            headerView.titleLabel.text = sectionTitles[indexPath.section]
            headerView.displayButton.tag = indexPath.section
            headerView.displayButton.addTarget(self, action: #selector(hideSectionAt(_:)), for: .touchUpInside)
            return headerView
        }
        return reusableView!
    }
    
    @objc func hideSectionAt(_ sender: UIButton) {
        print("selected item at indexPath: \(sender.tag)")
        if sectionIsOpened[sender.tag] {
            sectionIsOpened[sender.tag] = false
        } else {
            sectionIsOpened[sender.tag] = true
        }
        let sectionContent = IndexSet.init(integer: sender.tag)
        collectionView.reloadSections(sectionContent)
    }
    
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DrinkCollectionViewCell", for: indexPath) as? DrinkCollectionViewCell else {
                    print("Error with DrinkCollectionViewCell")
                    return UICollectionViewCell()
                }
                cell.drinkImage.image = UIImage(named: "Radler")
                cell.nameLabel.text = "Radler"
                return cell
            }
            
            if indexPath.row == 1 {
                // Cell Example 3
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell3", for: indexPath) as? HomeCell3 else {
                    print("ERROR with HomeCell3")
                    return UICollectionViewCell()
                }
                cell.drinkImage.image = UIImage(named: "Radler")
                
                return cell
            }
            if indexPath.row == 2 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell2", for: indexPath) as? HomeCell2 else {
                    print("ERROR with HomeCell2")
                    return UICollectionViewCell()
                }
                cell.drinkImage.image = UIImage(named: "Radler")
                cell.nameLabel.text = "Radler"
                return cell
            }
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell1", for: indexPath) as? HomeCell1 else {
                print("ERROR with HomeCell1")
                return UICollectionViewCell()
            }
            cell.drinkImage.image = UIImage(named: "Radler")
            cell.nameLabel.text = "Radler"
            return cell

                    
        }
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullSize1", for: indexPath) as? FullSize1 else {
                    print("Error with FullSize1 Collection Cell")
                    return UICollectionViewCell()
                }
                cell.drinkImage.image = UIImage(named: "Radler")
                cell.nameLabel.text = "Radler"
                cell.categoryLabel.text = "Ordinary"
                return cell
            }
            if indexPath.row == 1 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullSize2", for: indexPath) as? FullSize2 else {
                    print("Error with FullSize2 Collection Cell")
                    return UICollectionViewCell()
                }
                cell.drinkImage.image = UIImage(named: "Radler")
                cell.nameLabel.text = "Radler"
                return cell
            }
            if indexPath.row == 2 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullSize3", for: indexPath) as? FullSize3 else { return UICollectionViewCell() }
                cell.categoryLabel.text = "Ordinary"
                cell.nameLabel.text = "Radler"
                cell.drinkImage.image = UIImage(named: "Radler")
                return cell
            }
        }
        if indexPath.section == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Square1", for: indexPath) as? Square1 else {
                print("Error with Square1")
                return UICollectionViewCell()
            }
            cell.drinkImage.image = UIImage(named: "Radler")
            cell.nameLabel.text = "Radler"
            cell.categoryLabel.text = "Ordinary"
            return cell

        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Cell frame - half of left and right padding - half of interspace
        if indexPath.section == 0 {
            let cellFrameWidth = (collectionView.frame.width / 2.0) - 20.0 - 5.0
            if indexPath.row == 3 {
                return CGSize(width: cellFrameWidth, height: 125.0)
            }
            return CGSize(width: cellFrameWidth , height: 100.0)
        }
        if indexPath.section == 1 {
            let cellFrameWidth = collectionView.frame.width - 40.0
            if indexPath.row == 0 {
                return CGSize(width: cellFrameWidth, height: 150.0)
            }
            if indexPath.row == 1 {
                return CGSize(width: cellFrameWidth, height: 200.0)
            }
            if indexPath.row == 2 {
                return CGSize(width: cellFrameWidth, height: 175.0)
            }
        }
        if indexPath.section == 2 {
            let cellFrameWidth = (collectionView.frame.width / 2.0) - 20.0 - 5.0
            if indexPath.row == 0 {
                return CGSize(width: cellFrameWidth, height: cellFrameWidth)
            }
        }
        let cellFrameWidth = collectionView.frame.width - 40.0
        return CGSize(width: cellFrameWidth, height: 150.0)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50.0)
    }
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

