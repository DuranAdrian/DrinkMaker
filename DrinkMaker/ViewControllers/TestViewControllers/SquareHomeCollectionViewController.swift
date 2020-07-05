//
//  SquareHomeCollectionViewController.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/27/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class SquareHomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var sectionTitles:[String] = ["Favorites", "Popular", "Random"]
    
    var drinks: [Drink] = [
        Drink(id: "14107", name: "Absolut Summertime", tags: [], category: DrinkMaker.CategoryType.cocktail, hasAlcohol: true, glass: DrinkMaker.GlassType.collinsGlass, instructions: "Add all ingredients except lemon to shaker filled with ice. Cover and shake vigorously. Strain contents into ice filled collins glass. Garnish with lemon.", imageUrl: "https://www.thecocktaildb.com/images/media/drink/trpxxs1472669662.jpg", ingredients: ["Absolut Citron", "Sweet and sour", "Sprite", "Soda water", "Lemon"], measurements: ["1 1/2 oz ", "3/4 oz ", "1/2 oz ", "3 oz ", "1 slice "], dateModified: "2016-08-31 19:54:22"),
        Drink(id: "15395", name: "1-900-FUK-MEUP", tags: [], category: DrinkMaker.CategoryType.shot, hasAlcohol: true, glass: DrinkMaker.GlassType.oldFashionedGlass, instructions: "Shake ingredients in a mixing tin filled with ice cubes. Strain into a rocks glass.", imageUrl: "https://www.thecocktaildb.com/images/media/drink/uxywyw1468877224.jpg", ingredients: ["Absolut Kurant", "Grand Marnier", "Chambord raspberry liqueur", "Midori melon liqueur", "Malibu rum", "Amaretto", "Cranberry juice", "Pineapple juice"], measurements: ["1/2 oz ", "1/4 oz ", "1/4 oz ", "1/4 oz ", "1/4 oz ", "1/4 oz ", "1/2 oz ", "1/4 oz "], dateModified: "2016-07-18 22:27:04"),
        Drink(id: "17215", name: "Spritz", tags: [], category: DrinkMaker.CategoryType.ordinaryDrink, hasAlcohol: true, glass: DrinkMaker.GlassType.oldFashionedGlass, instructions: "Build into glass over ice, garnish and serve.", imageUrl: "https://www.thecocktaildb.com/images/media/drink/j9evx11504373665.jpg", ingredients: ["Prosecco", "Campari", "Soda Water"], measurements: ["6 cl", "4 cl", "splash"], dateModified: "2017-09-02 18:34:25"),
        Drink(id: "11005", name: "Dry Martini", tags: ["IBA", "Classic"], category: DrinkMaker.CategoryType.cocktail, hasAlcohol: true, glass: DrinkMaker.GlassType.cocktailGlass, instructions: "Straight: Pour all ingredients into mixing glass with ice cubes. Stir well. Strain in chilled martini cocktail glass. Squeeze oil from lemon peel onto the drink, or garnish with olive.", imageUrl: "https://www.thecocktaildb.com/images/media/drink/6ck9yi1589574317.jpg", ingredients: ["Gin", "Dry Vermouth", "Olive"], measurements: ["1 2/3 oz ", "1/3 oz ", "1 "], dateModified: "2017-09-02 12:51:35"),
        Drink(id: "11604", name: "Kentucky Colonel", tags: [], category: DrinkMaker.CategoryType.ordinaryDrink, hasAlcohol: true, glass: DrinkMaker.GlassType.cocktailGlass, instructions: "In a shaker half-filled with ice cubes combine the courbon and Benedictine. Shake and strain into a cocktail glass. Garnish with the lemon twist.", imageUrl: "https://www.thecocktaildb.com/images/media/drink/utqwpu1478820348.jpg", ingredients: ["Bourbon", "Benedictine", "Lemon peel"], measurements: ["3 oz ", "1/2 oz ", "1 twist of "], dateModified: "2016-11-10 23:25:48"),
        Drink(id: "15515", name: "Tennesee Mud", tags: [], category: DrinkMaker.CategoryType.coffeeTea, hasAlcohol: true, glass: DrinkMaker.GlassType.coffeeMug, instructions: "Mix Coffee, Jack Daniels and Amaretto. Add Cream on top.", imageUrl: "https://www.thecocktaildb.com/images/media/drink/txruqv1441245770.jpg", ingredients: ["Coffee", "Jack Daniels", "Amaretto", "Whipped cream"], measurements: ["8 oz ", "4 oz ", "4 oz "], dateModified: "2015-09-03 03:02:50"),
        Drink(id: "11113", name: "Bloody Mary", tags: ["IBA", "ContemporaryClassic"], category: DrinkMaker.CategoryType.ordinaryDrink, hasAlcohol: true, glass: DrinkMaker.GlassType.oldFashionedGlass, instructions: "Stirring gently, pour all ingredients into highball glass. Garnish.", imageUrl: "https://www.thecocktaildb.com/images/media/drink/t6caa21582485702.jpg", ingredients: ["Vodka", "Tomato juice", "Lemon juice", "Worcestershire sauce", "Tabasco sauce", "Lime"], measurements: ["1 1/2 oz ", "3 oz ", "1 dash ", "1/2 tsp ", "2-3 drops ", "1 wedge "], dateModified: "2015-08-18 15:09:14"),
        Drink(id: "12784", name: "Thai Iced Coffee", tags: [], category: DrinkMaker.CategoryType.coffeeTea, hasAlcohol: false, glass: DrinkMaker.GlassType.highballGlass, instructions: "Prepare a pot of coffee at a good European strength. In the ground coffee, add 2 or 3 freshly ground cardamom pods. Sweeten while hot, then cool quickly. Serve in highball glass over ice, with cream. To get the layered effect, place a spoon atop the coffee and pour the milk carefully into the spoon so that it floats on the top of the coffee.", imageUrl: "https://www.thecocktaildb.com/images/media/drink/rqpypv1441245650.jpg", ingredients: ["Coffee", "Sugar", "Cream", "Cardamom"], measurements: ["black", " pods\n"], dateModified: "2015-09-03 03:00:50"),
        Drink(id: "12862", name: "Aloha Fruit punch", tags: [], category: DrinkMaker.CategoryType.punchPartyDrink, hasAlcohol: false, glass: DrinkMaker.GlassType.collinsGlass, instructions: "Add 1/4 cup water to ginger root. Boil 3 minutes. Strain. Add the liquid to the guava, lemon and pineapple juices. Make a syrup of sugar and remaining water. Cool. Combine with juices and pineapple. Chill throroughly.", imageUrl: "https://www.thecocktaildb.com/images/media/drink/wsyvrt1468876267.jpg", ingredients: ["Water", "Ginger", "Guava juice", "Lemon juice", "Pineapple", "Sugar", "Pineapple juice"], measurements: ["3/4 cup ", "2 tsp ", "2 cups ", "1 1/2 tblsp ", "1 1/2 cup ", "1 cup ", "3-4 cups "], dateModified: "2016-07-18 22:11:07"),
        Drink(id: "12716", name: "Mango Orange Smoothie", tags: [], category: DrinkMaker.CategoryType.otherUnknown, hasAlcohol: false, glass: DrinkMaker.GlassType.highballGlass, instructions: "Throw everything into a blender and liquify.", imageUrl: "https://www.thecocktaildb.com/images/media/drink/vdp2do1487603520.jpg", ingredients: ["Mango", "Orange"], measurements: ["1 ", "2 "], dateModified: "2017-02-20 15:12:01")
    ]
    var drinkImageName: [String] = ["AbsoluteSummertime", "1900FUKMEUP", "Spritz", "DryMartini", "KentukcyColonel", "TenneseeMud", "BloodyMary", "ThaiIcedCoffee", "AlohaFruitPunch", "MangoOrangeSmoothie"]
    var sectionIsOpened:[Bool] = [true, true, true]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        setUpNavBar()
    }
    
    private func setUpNavBar() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Lato-Bold", size: 20.0)!]
        navigationController?.navigationBar.backgroundColor = UIColor.CustomBackgroundColor.dark
        navigationController?.navigationBar.barTintColor = UIColor.CustomBackgroundColor.dark
        navigationController?.navigationBar.isTranslucent = false
        // Add Bar Button to generate random drink
        let rightbutton = UIBarButtonItem()
        rightbutton.image = UIImage(systemName: "wand.and.stars")
        rightbutton.target = self
        rightbutton.action = #selector(generateRandomDrink(_:))
        navigationItem.rightBarButtonItem = rightbutton
    }
    
    private func setUpCollectionView() {
        self.collectionView!.register(UINib.init(nibName: "Square1", bundle: nil),forCellWithReuseIdentifier: "Square1")
        collectionView.contentInset = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
        collectionView.backgroundColor = UIColor.CustomBackgroundColor.dark
        collectionView.register(SectionCollectionHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader")
        // Square Cells
        collectionView.register(UINib.init(nibName: "Square1", bundle: nil), forCellWithReuseIdentifier: "Square1")
    }
    
    @objc func hideSectionAt(_ sender: UIButton) {
        print("selected item at indexPath: \(sender.tag)")
        if sectionIsOpened[sender.tag] {
            sectionIsOpened[sender.tag] = false
        } else {
            sectionIsOpened[sender.tag] = true
        }
        let sectionContent = IndexSet.init(integer: sender.tag)
        self.collectionView.reloadSections(sectionContent)
        
    }
    
    @objc func generateRandomDrink(_ sender: UIBarButtonItem) {
        sender.isEnabled = false
//            sender.backgroundColor = .cyan
        
        NetworkManager().drinks.getRandomDrink(completion: { drink, error in
            if let error = error {
                print("Error: \(error)")
                DispatchQueue.main.async {
                    let ac = UIAlertController(title: "Whoops", message: error, preferredStyle: .alert)
                    let okayAction = UIAlertAction.init(title: "Okay", style: .default, handler: { action in
                        DispatchQueue.main.async {
                            sender.isEnabled = true
//                                sender.backgroundColor = .purple
                        }
                    })
                    ac.addAction(okayAction)
                    self.present(ac, animated: true)
                }
            }
            if let randomDrink = drink {
//                print(randomDrink)
                if let imageURL = URL(string: randomDrink.imageUrl) {
                    if let imageData = try? Data(contentsOf: imageURL) {
                        if let image = UIImage(data: imageData) {
                            DispatchQueue.main.async {
                                let vc = UpdatedSingleDrinkTableViewController()
                                vc.drink = randomDrink
                                
                                self.navigationController?.pushViewController(vc, animated: true)
//                                self.imageView.image = image
//                                self.imageView.contentMode = .scaleAspectFit
                                sender.isEnabled = true
//                                    sender.backgroundColor = .purple
//                                self.nameLabel.text = randomDrink.name
                            }
                        }
                    }
                }

            }
        })
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
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView: UICollectionReusableView? = nil
        // Create Section Header
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionCollectionHeaderReusableView
            headerView.titleLabel.text = sectionTitles[indexPath.section]
            headerView.displayButton.tag = indexPath.section
            headerView.displayButton.addTarget(self, action: #selector(hideSectionAt(_:)), for: .touchUpInside)
            
            if sectionIsOpened[indexPath.section] {
                headerView.displayButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            } else {
                headerView.displayButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            }
            return headerView
        }
        return reusableView!
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionTitles.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            if sectionIsOpened[section] {
                return drinks.count
            }
        }
        if section == 1 {
            if sectionIsOpened[section] {
                return drinks.count
            }
        }
        if section == 2 {
            if sectionIsOpened[section] {
                return drinks.count
            }
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Square1", for: indexPath) as? Square1 else { return UICollectionViewCell() }
    
        // Configure the cell
        cell.nameLabel.text = drinks[indexPath.row].name
        cell.categoryLabel.text = drinks[indexPath.row].category.description
        cell.drinkImage.image = UIImage(named: drinkImageName[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 2 Items per row
        let cellFrameWidth = (collectionView.frame.width - 40.0 - 10.0) / 2.0
        
        // 3 Items per row
        let threeItemWidth = (collectionView.frame.width - 40.0 - 20.0) / 3.0
        return CGSize(width: cellFrameWidth, height: cellFrameWidth)
        
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

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Cell at \(indexPath)")
        print("Drink data is: \(drinks[indexPath.row])")
        let cell = collectionView.cellForItem(at: indexPath) as! Square1
        let vc = UpdatedSingleDrinkTableViewController()
        vc.drink = drinks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
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
