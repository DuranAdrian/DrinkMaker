//
//  DrinksAPI.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/17/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import Foundation
import UIKit

class DrinkAPI: NetworkManager {
    // Get Single Drink By Drink ID
    public func getSingleDrink(drinkID: String, completion: @escaping (_ drink: Drink?, _ error: String?) -> ()) {
        let urlString =  "https://www.thecocktaildb.com/api/json/v1/\(self.apiKey)/lookup.php?i=\(drinkID)"
        
        guard let drinkURL = URL(string: urlString) else {
            completion(nil, "Error Creating single Drink URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: drinkURL, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            if let data = data {
                do {
                    let drink = try self.decoder.decode(DrinkContainer.self, from: data)
//                    print(listOfDrinks)
                    completion(drink.drinks[0], nil)
                } catch {
                    completion(nil, "Error Parsing JSON \(error)")
                    return
                }
            }
        })
        
    
        task.resume()
    }
    
    // Get Array of Drinks With Given Name
    public func getDrinksWithName(drinkName: String, completion: @escaping (_ drinks: [Drink]?, _ error: String?) -> ()) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/\(self.apiKey)/search.php?s=\(drinkName)"
        
        guard let drinksURL = URL(string: urlString) else {
            completion(nil, "Error Creating Drinks URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: drinksURL, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            if let data = data {
                do {
                    let listOfDrinks = try self.decoder.decode(DrinkContainer.self, from: data)
                    completion(listOfDrinks.drinks, nil)
                    return
                } catch {
                    completion(nil, "Error parsing JSON \(error)")
                    return
                }
            }
        })
        task.resume()
    }
    
    // Get a single Random Drink
    public func getRandomDrink(completion: @escaping (_ drinks: Drink?, _ error: String?) -> ()) {
        let urlString =  "https://www.thecocktaildb.com/api/json/v1/\(self.apiKey)/random.php"
                
        guard let drinkURL = URL(string: urlString) else {
            completion(nil, "Error Creating Random Drink URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: drinkURL, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            if let data = data {
                do {
                    let drink = try self.decoder.decode(DrinkContainer.self, from: data)
//                    print(listOfDrinks)
                    completion(drink.drinks[0], nil)
                } catch {
                    completion(nil, "Error Parsing Random JSON \(error)")
                }
                print("------------------------------------")
            }
        })
        
    
        task.resume()

    }
    
    // Get Array of Drinks By First Letter
    public func getDrinksWithLetter(firstLetter: String, completion: @escaping (_ drinks: [Drink]?, _ error: String?) -> ()) {
//        let urlString = "https://wwww.thecocktaildb.com/api/json/v1/\(self.apiKey)/search.php?f=\(firstLetter)"
        let urlString = "https://www.thecocktaildb.com/api/json/v1/\(self.apiKey)/search.php?f=\(firstLetter)"
        
        guard let drinkURL = URL(string: urlString) else {
            completion(nil, "Error Creating DrinksWithLetter URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: drinkURL, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            
            if let data = data {
                do {
                    let listOfDrinks = try self.decoder.decode(DrinkContainer.self, from: data)
                    completion(listOfDrinks.drinks, nil)
                    return
                } catch {
                    completion(nil, "Error Parsing JSON \(error)")
                    return
                }
            }
        })
        task.resume()
    }
    
    // Get Array of Alcohol or Not Drinks
    public func getAlcoholicDrinks(hasAlcohol: Bool, completion: @escaping(_ drinks: [Drink]?, _ error: String?) -> ()) {
        var urlString: String = ""
        if hasAlcohol {
            urlString = "https://www.thecocktaildb.com/api/json/v1/\(self.apiKey)/filter.php?a=Alcoholic"
        } else {
            urlString = "https://www.thecocktaildb.com/api/json/v1/\(self.apiKey)/filter.php?a=Non_Alcoholic"
        }
        
        guard let drinksURL = URL(string: urlString) else {
            completion(nil, "Error Creating Alcohol URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: drinksURL, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            
            if let drinkData = data {
                do {
                    var listOfDrinks = try self.decoder.decode(DrinkContainer.self, from: drinkData)
                    for (index,_) in listOfDrinks.drinks.enumerated() {
                        listOfDrinks.drinks[index].hasAlcohol = hasAlcohol
                    }
                    completion(listOfDrinks.drinks, nil)
                    return
                } catch {
                    completion(nil, "Error parsing JSON \(error)")
                    return
                }
            }
        })
        task.resume()
    }
    
    // Get Array of Category Drinks
    public func getCategoryDrinks(category: CategoryType, completion: @escaping(_ drinks: [Drink]?, _ error: String?) -> ()) {
        var urlString: String = "https://www.thecocktaildb.com/api/json/v1/\(self.apiKey)/filter.php?c=\(category.apiFriendlyString)"
        
        
        guard let drinksURL = URL(string: urlString) else {
            completion(nil, "Error Creating Category URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: drinksURL, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            
            if let drinkData = data {
                do {
                    var listOfDrinks = try self.decoder.decode(DrinkContainer.self, from: drinkData)
                    completion(listOfDrinks.drinks, nil)
                    return
                } catch {
                    completion(nil, "Error parsing JSON \(error)")
                    return
                }
            }
        })
        task.resume()
    }
    
    // Get Array of Glass Drinks
    public func getGlassDrinks(glass: GlassType, completion: @escaping(_ drinks: [Drink]?, _ error: String?) -> ()) {
        var urlString: String = "https://www.thecocktaildb.com/api/json/v1/\(self.apiKey)/filter.php?g=\(glass.apiFriendlyString)"
        
        
        guard let drinksURL = URL(string: urlString) else {
            completion(nil, "Error Creating Glass URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: drinksURL, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            
            if let drinkData = data {
                do {
                    var listOfDrinks = try self.decoder.decode(DrinkContainer.self, from: drinkData)
                    completion(listOfDrinks.drinks, nil)
                    return
                } catch {
                    completion(nil, "Error parsing JSON \(error)")
                    return
                }
            }
        })
        task.resume()
    }
    
    // Get Regular Drink Image
    public func getRegularDrinkImage(imageUrl: String, completion: @escaping(_ image: UIImage?, _ error: String?) -> ()) {
//        let urlString = "https://www.thecocktaildb.com/images/ingredients/\(ingredientName.lowercased().replacingOccurrences(of: " ", with: "%20")).png"
        
        guard let imageURL = URL(string: imageUrl) else {
            completion(UIImage(named: "Cocktail-Placeholder"), "Error Creating Drink Image URL")
            return
        }
        if let imageData = try? Data(contentsOf: imageURL) {
            if let image = UIImage(data: imageData) {
                completion(image, nil)
                return
            }
        }
        completion(nil, "Error Getting Drink Image")
        return
    }
    
}
