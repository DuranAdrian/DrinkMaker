//
//  IngredientAPI.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/18/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import Foundation
import UIKit

class IngredientAPI: NetworkManager {
    // Get Single Ingredient from Given Name
    public func getIngredientWithName(ingredient: String, completion: @escaping(_ ingredient: Ingredient?, _ error: String?) -> ()) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/\(self.apiKey)/search.php?i=\(ingredient)"
        
        guard let ingredientURL = URL(string: urlString) else {
            completion(nil, "Error Creating IngredientName URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: ingredientURL, completionHandler: { (data, response, error ) -> Void in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            
            if let data = data {
                do {
                    let incomingIngredient = try self.decoder.decode(IngredientContainer.self, from: data)
                    completion(incomingIngredient.ingredients[0], nil)
                    return
                } catch {
                    completion(nil, "Error Parsing JSON data")
                    return
                }
            }
        })
        task.resume()
    }
    
    // Get Single Ingredient From Given ID
    public func getIngredientWithID(ingredientID: String, completion: @escaping(_ ingredient: Ingredient?, _ error: String?) -> ()) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/\(self.apiKey)/lookup.php?iid=\(ingredientID)"
        
        guard let ingredientURL = URL(string: urlString) else {
            completion(nil, "Error Creating IngredientID URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: ingredientURL, completionHandler: { (data, response, error ) -> Void in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            
            if let data = data {
                do {
                    let incomingIngredient = try self.decoder.decode(IngredientContainer.self, from: data)
                    completion(incomingIngredient.ingredients[0], nil)
                    return
                } catch {
                    completion(nil, "Error Parsing JSON data")
                    return
                }
            }
        })
        task.resume()
    }
    
    // Get List of Ingredients
    // Currently the free Key will return 100 items
    public func getListOfIngredients(completion: @escaping(_ ingredient: [testIngredientList]?, _ error: String?) -> ()) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/\(self.apiKey)/list.php?i=list"
        
        guard let ingredientURL = URL(string: urlString) else {
            completion(nil, "Error Creating IngredientID URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: ingredientURL, completionHandler: { (data, response, error ) -> Void in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            
            if let data = data {
                do {
                    let incomingIngredient = try self.decoder.decode(testIngredientListContainer.self, from: data)
                    completion(incomingIngredient.list, nil)
                    return
                } catch {
                    completion(nil, "Error Parsing JSON data")
                    return
                }
            }
        })
        task.resume()
    }
    
    // Get Medium 100x100 Ingredient Image
    public func getSmallIngredientImage(ingredientName: String, completion: @escaping(_ image: UIImage?, _ error: String?) -> ()) {
        let urlString = "https://www.thecocktaildb.com/images/ingredients/\(ingredientName.lowercased().replacingOccurrences(of: " ", with: "%20"))-Small.png"
        
        guard let imageURL = URL(string: urlString) else {
            completion(UIImage(named: "Ingredient-Placeholder"), "Error Creating Medium Image URL")
            return
        }
        if let imageData = try? Data(contentsOf: imageURL) {
            if let image = UIImage(data: imageData) {
                completion(image, nil)
                return
            }
        }
        completion(nil, "Error Getting Medium Image")
        return
    }
    
    // Get Medium 350x350 Ingredient Image
    public func getMediumIngredientImage(ingredientName: String, completion: @escaping(_ image: UIImage?, _ error: String?) -> ()) {
        let urlString = "https://www.thecocktaildb.com/images/ingredients/\(ingredientName.lowercased().replacingOccurrences(of: " ", with: "%20"))-Medium.png"
        
        guard let imageURL = URL(string: urlString) else {
            completion(UIImage(named: "Ingredient-Placeholder"), "Error Creating Medium Image URL")
            return
        }
        if let imageData = try? Data(contentsOf: imageURL) {
            if let image = UIImage(data: imageData) {
                completion(image, nil)
                return
            }
        }
        completion(nil, "Error Getting Medium Image")
        return
    }
    
    // Get Regular 700x700 Ingredient Image
    public func getRegularIngredientImage(ingredientName: String, completion: @escaping(_ image: UIImage?, _ error: String?) -> ()) {
        let urlString = "https://www.thecocktaildb.com/images/ingredients/\(ingredientName.lowercased().replacingOccurrences(of: " ", with: "%20")).png"
        
        guard let imageURL = URL(string: urlString) else {
            completion(UIImage(named: "Ingredient-Placeholder"), "Error Creating Medium Image URL")
            return
        }
        if let imageData = try? Data(contentsOf: imageURL) {
            if let image = UIImage(data: imageData) {
                completion(image, nil)
                return
            }
        }
        completion(nil, "Error Getting Medium Image")
        return
    }
}
