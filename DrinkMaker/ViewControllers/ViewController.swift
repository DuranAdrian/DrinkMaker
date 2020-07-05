//
//  ViewController.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/17/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .black
        view.image = UIImage(named: "nightBackground")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let randomButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Random Drink", for: .normal)
        button.titleLabel?.text = "Randamize Drink"
        button.addTarget(self, action: #selector(generateRandomDrink(_:)), for: .touchUpInside)
        button.backgroundColor = .purple
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        
        view.addSubview(randomButton)
        randomButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0).isActive = true
        randomButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10.0).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50.0).isActive = true
        
//        networkManager.drinks.getSingleDrink(drinkID: "16158", completion: { drink, error in
//            if let error = error {
//                print("ERROR: \(error)")
//                return
//            }
//            if let newDrink = drink {
//                print("SINGLE DRINK SUCCESS:")
//                print(newDrink)
//                if let imageURL = URL(string: newDrink.imageUrl) {
//                    if let imageData = try? Data(contentsOf: imageURL) {
//                        if let image = UIImage(data: imageData) {
//                            DispatchQueue.main.async {
//                                self.imageView.image = image
//                                self.imageView.contentMode = .scaleAspectFit
//                            }
//                        }
//                    }
//                }
//            }
//        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        networkManager.drinks.getDrinksWithName(drinkName: "Margarita", completion: { drinks, error in
//            if let error = error {
//                print("Error: \(error)")
//                DispatchQueue.main.async {
//                    let ac = UIAlertController(title: "Whoops", message: error, preferredStyle: .alert)
//                    let okayAction = UIAlertAction.init(title: "Okay", style: .default, handler: nil)
//                    ac.addAction(okayAction)
//                    self.present(ac, animated: true)
//
//                }
//                return
//            }
//            if let drinks = drinks {
//                print("List of Drinks Success")
//                print(drinks)
//            }
//        })

//        networkManager.drinks.getRandomDrink(completion: { drink, error in
//            if let error = error {
//                print("Error: \(error)")
//                DispatchQueue.main.async {
//                    let ac = UIAlertController(title: "Whoops", message: error, preferredStyle: .alert)
//                    let okayAction = UIAlertAction.init(title: "Okay", style: .default, handler: nil)
//                    ac.addAction(okayAction)
//                    self.present(ac, animated: true)
//                }
//            }
//            if let randomDrink = drink {
//                print("SINGLE DRINK SUCCESS:")
//                print(randomDrink)
//                if let imageURL = URL(string: randomDrink.imageUrl) {
//                    if let imageData = try? Data(contentsOf: imageURL) {
//                        if let image = UIImage(data: imageData) {
//                            DispatchQueue.main.async {
//                                self.imageView.image = image
//                                self.imageView.contentMode = .scaleAspectFit
//                                self.nameLabel.text = randomDrink.name
//                            }
//                        }
//                    }
//                }
//
//            }
//        })
//        networkManager.drinks.getCategoryDrinks(category: .punchPartyDrink, completion: { drinks, error in
//            if let error = error {
//                print("Error: \(error)")
//                DispatchQueue.main.async {
//                    let ac = UIAlertController(title: "Whoops", message: error, preferredStyle: .alert)
//                    let okayAction = UIAlertAction.init(title: "Okay", style: .default, handler: nil)
//                    ac.addAction(okayAction)
//                    self.present(ac, animated: true)
//                }
//            }
//            if let listOfDrinks = drinks {
//                print("FOUND CATEGORY DRINKS")
//                print("----------------------")
//                print(listOfDrinks)
//                print("----------------------")
//            }
//        })
//        networkManager.drinks.getGlassDrinks(glass: .hurricaneglass, completion: { drinks, error in
//            if let error = error {
//                print("Error: \(error)")
//                DispatchQueue.main.async {
//                    let ac = UIAlertController(title: "Whoops", message: error, preferredStyle: .alert)
//                    let okayAction = UIAlertAction.init(title: "Okay", style: .default, handler: nil)
//                    ac.addAction(okayAction)
//                    self.present(ac, animated: true)
//                }
//            }
//            if let listOfDrinks = drinks {
//                print("FOUND GLASS DRINKS")
//                print("----------------------")
//                print(listOfDrinks)
//                print("----------------------")
//            }
//        })
        networkManager.ingredients.getListOfIngredients(completion: { ingredientList, error in
            if let error = error {
                print("Error: \(error)")
                DispatchQueue.main.async {
                    let ac = UIAlertController(title: "Whoops", message: error, preferredStyle: .alert)
                    let okayAction = UIAlertAction.init(title: "Okay", style: .default, handler: nil)
                    ac.addAction(okayAction)
                    self.present(ac, animated: true)
                }
            }
            if let ingredientList = ingredientList {
//                print("FOUND INGREDIENT LIST")
//                print("----------------------")
//                print(ingredientList)
//                print("Total Count: \(ingredientList.count)")
//                print("----------------------")

            }
            
        })

    }

    @objc func generateRandomDrink(_ sender: UIButton) {
        sender.isEnabled = false
        sender.backgroundColor = .cyan
        
        networkManager.drinks.getRandomDrink(completion: { drink, error in
            if let error = error {
                print("Error: \(error)")
                DispatchQueue.main.async {
                    let ac = UIAlertController(title: "Whoops", message: error, preferredStyle: .alert)
                    let okayAction = UIAlertAction.init(title: "Okay", style: .default, handler: { action in
                        DispatchQueue.main.async {
                            sender.isEnabled = true
                            sender.backgroundColor = .purple
                        }
                    })
                    ac.addAction(okayAction)
                    self.present(ac, animated: true)
                }
            }
            if let randomDrink = drink {
                print("SINGLE DRINK SUCCESS:")
                print(randomDrink)
                print("MODIFED INGREDIENTS: \(randomDrink.combineMeasurementsIngredients())")
                if let imageURL = URL(string: randomDrink.imageUrl) {
                    if let imageData = try? Data(contentsOf: imageURL) {
                        if let image = UIImage(data: imageData) {
                            DispatchQueue.main.async {
                                let vc = UpdatedSingleDrinkTableViewController()
                                vc.drink = randomDrink
                                self.present(vc, animated: true, completion: nil)
//                                self.imageView.image = image
//                                self.imageView.contentMode = .scaleAspectFit
                                sender.isEnabled = true
                                sender.backgroundColor = .purple
//                                self.nameLabel.text = randomDrink.name
                            }
                        }
                    }
                }

            }
        })
    }
    
    @objc func selectIngredient(_ sender: UIButton) {
        sender.isEnabled = false
        sender.backgroundColor = .green
        
        networkManager.ingredients.getIngredientWithName(ingredient: "Vodka", completion: { ingredient, error in
            if let error = error {
                print("Error: \(error)")
                DispatchQueue.main.async {
                    let ac = UIAlertController(title: "Whoops", message: error, preferredStyle: .alert)
                    let okayAction = UIAlertAction.init(title: "Okay", style: .default, handler: { action in
                        DispatchQueue.main.async {
                            sender.isEnabled = true
                            sender.backgroundColor = .purple
                        }
                    })
                    ac.addAction(okayAction)
                    self.present(ac, animated: true)
                }
            }
            
            if let ingredient = ingredient {
                print("Ingredient Success! :\(ingredient)")
                // If imageString is empty, use placeHolder Image
                if ingredient.imageStringURL.isEmpty {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(named: "Ingredient-Placeholder")
                        self.imageView.contentMode = .scaleAspectFit
                        self.imageView.backgroundColor = .white
                        sender.isEnabled = true
                        sender.backgroundColor = .purple
                        self.nameLabel.text = "Unknown Image"
                    }
                } else {
                    if let imageURL = URL(string: ingredient.imageStringURL) {
                        if let imageData = try? Data(contentsOf: imageURL) {
                            if let image = UIImage(data: imageData) {
                                DispatchQueue.main.async {
                                    self.imageView.image = image
                                    self.imageView.contentMode = .scaleAspectFit
                                    sender.isEnabled = true
                                    sender.backgroundColor = .purple
                                    self.nameLabel.text = ingredient.name
                                }
                            }
                        }
                    }
                }
            }
        })
    }

}

