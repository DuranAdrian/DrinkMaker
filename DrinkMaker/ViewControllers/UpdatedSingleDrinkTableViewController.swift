//
//  SingleDrinkTableViewController.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/19/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class UpdatedSingleDrinkTableViewController: UITableViewController {
    var drink: Drink = Drink()
//    var instructionsList: [String] = ["3 cups Water", "1 cup Sugar", "12 Cloves", "2 Cinnamon", "1 Lemon peel", "750 ml Red wine", "1/4 cup Brandy"]
//    var ingredientNames: [String] = ["Water", "Sugar", "Cloves", "Cinnamon", "Lemon peel", "Red wine", "Brandy"]
    var drinkIngredientsImages: [UIImage] = []
    var instructionsList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = .clear
//        print(drink.isNonExistant)
        if drink.isNonExistant {
            // For Testing Purposes
            print("DRINK IS NON EXISTANT")
            drink = Drink(id: "15675", name: "A midsummernight dream", tags: [], category: DrinkMaker.CategoryType.ordinaryDrink, hasAlcohol: true, glass: DrinkMaker.GlassType.collinsGlass, instructions: "Mix the strawberrys in a blender Pour it together with the vodka,kirch and strawberry liquer over ice in a shaker. Shake well and pour in a highballglass. Fill up with the Russchian water", imageUrl: "https://www.thecocktaildb.com/images/media/drink/qyxrqw1439906528.jpg", ingredients: ["Vodka", "Kirschwasser", "Strawberry liqueur", "Strawberries", "Schweppes Russchian"], measurements: ["2 oz ", "1 oz ", "1 tsp ", "5 "], dateModified: "2016-04-28 19:14:52")

        }
        instructionsList = drink.combineMeasurementsIngredients()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        print("Getting drink image from URL...")
        NetworkManager().drinks.getRegularDrinkImage(imageUrl: drink.imageUrl, completion: {(image, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    self.tableView.tableHeaderView = DrinkPictureView(frame: CGRect(x: 0.0, y: 0.0, width: self.tableView.frame.width, height: self.view.frame.height * 0.45), imageToDisplay: UIImage(named: "Cocktail-Placeholder")!)
                }
            }
            if let image = image {
                DispatchQueue.main.async {
                    self.tableView.tableHeaderView = DrinkPictureView(frame: CGRect(x: 0.0, y: 0.0, width: self.tableView.frame.width, height: self.view.frame.height * 0.45), imageToDisplay: image)
                }

            }
        })
//        tableView.tableHeaderView = DrinkPictureView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.width, height: view.frame.height * 0.45), imageToDisplay: drink.im)
        
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib.init(nibName: "UpdatedDrinkDetailsTableCell", bundle: nil), forCellReuseIdentifier: "UpdatedDrinkDetailsTableCell")
    
        tableView.register(UINib.init(nibName: "IngredientCell", bundle: nil), forCellReuseIdentifier: "IngredientCell")
        tableView.register(IngredientImagesTableViewCell.self, forCellReuseIdentifier: "IngredientImagesTableViewCell")
        tableView.register(TestInstructionsCell.self, forCellReuseIdentifier: "TestInstructionsCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.separatorInset = .zero
        tableView.separatorColor = .clear
        tableView.backgroundColor = UIColor.CustomBackgroundColor.dark
        tableView.showsVerticalScrollIndicator = false
        
        
        
//        tableView.contentInsetAdjustmentBehavior = .never
        // Adjust TableView Content View
        // Get status bar height
        let adjustedHeight = (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 44.0) + (navigationController?.navigationBar.frame.height ?? 0.0)
        tableView.contentInset = UIEdgeInsets(top: -adjustedHeight, left: 0.0, bottom: 0.0, right: 0.0)
        getIngredientImages()
    }
    
    // TODO: RELOCATE SOMEWHERE ELSE
    func setTableViewBackgroundGradient(firstColor: UIColor, secondColor: UIColor) {
        tableView.backgroundColor = .clear
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = tableView.bounds
        let backgroundView = UIView(frame: tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        tableView.backgroundView = backgroundView
    }
    
    func getIngredientImages() {
        for ingredient in drink.ingredients {
            NetworkManager().ingredients.getMediumIngredientImage(ingredientName: ingredient, completion: { image, error in
                if let _ = error {
                    self.drinkIngredientsImages.append(UIImage(named: "Ingredient-Placeholder")!)
                }
                if let image = image {
                    self.drinkIngredientsImages.append(image)
                }
            })
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.backgroundColor = UIColor.CustomBackgroundColor.dark

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.backgroundColor = .clear
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // TODO: Properly finish Share Function
    @objc func shareDrink(_ sender: UIBarButtonItem) {
        // Show UIActivityViewController to Share user
        let userToShare = ["Look at this Drink I found"]
        let ac = UIActivityViewController(activityItems: userToShare, applicationActivities: nil)
        present(ac, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 1 {
            return drink.combineMeasurementsIngredients().count + 1
//            return instructionsList.count + 1
//            return drink.combineMeasurementsIngredients().count
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        if section == 1 {
            return SectionTitleView(title: "Ingredients")
        }
        if section == 2 {
            return SectionTitleView(title: "Instructions")
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0.0 : 50.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UpdatedDrinkDetailsTableCell", for: indexPath) as? UpdatedDrinkDetailsTableCell else { return UITableViewCell() }
            
            if drink.hasAlcohol {
                cell.modifyNameLabel(with: drink.name)
            } else {
                cell.nameLabel.text = drink.name
            }
            cell.nameLabel.adjustsFontSizeToFitWidth = true
//            cell.modifyNameLabel(with: drink.name)
            cell.categoryTagsView.addTag(drink.category.description)
            if drink.tags.isEmpty {
                cell.tagTagsView.addTag("No Tags")
            } else {
                cell.tagTagsView.addTags(drink.tags)
            }
//            cell.tagTagsView.addTags(drink.tags)
            cell.shareButton.imageView?.contentMode = .scaleAspectFit
            cell.shareButton.addTarget(self, action: #selector(shareDrink(_:)), for: .touchUpInside)
            cell.categoryTagsView.textFont = UIFont(name: "Lato-Regular", size: 12.0)!
            cell.tagTagsView.textFont = UIFont(name: "Lato-Regular", size: 12.0)!
            cell.backgroundColor = .clear
            return cell

        
        }
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientImagesTableViewCell", for: indexPath) as! IngredientImagesTableViewCell
//                cell.ingredientCount = instructionsList.count
//                cell.ingredientNames = ["Firewater", "Absolut Peppar", "Tabasco sauce","Firewater", "Absolut Peppar", "Tabasco sauce", "Absolut Peppar"]
                cell.ingredientImages = drinkIngredientsImages
                cell.backgroundColor = .clear
                return cell
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
            cell.setUpCell()
            cell.Ingredient.text = instructionsList[indexPath.row - 1]
            return cell
        }
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TestInstructionsCell", for: indexPath) as! TestInstructionsCell
            cell.instructionLabel.text = drink.instructions
            cell.serveLabel.text = drink.glass.serveDescription
            cell.backgroundColor = .clear
            return cell
        }
        let cell = UITableViewCell()
        cell.backgroundColor = .cyan
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                // Set Row Height for Ingredient Images
                // Return Cell Height plus padding from top and bottom
                return 75.0 + 10.0
            }
        }
        return UITableView.automaticDimension
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
