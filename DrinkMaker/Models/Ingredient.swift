//
//  Ingredient.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/18/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import Foundation

struct Ingredient: Codable {
    var id: String
    var name: String
    var description: String
    var imageStringURL: String
    var type: String
    var hasAlcohol: Bool
    var abv: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idIngredient"
        case name = "strIngredient"
        case description = "strDescription"
        case type = "strType"
        case hasAlcohol = "strAlcohol"
        case abv = "strABV"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let idString = try container.decodeIfPresent(String.self, forKey: .id)
        if let idString = idString {
            id = idString
        } else {
            id = "Uknown ID"
        }
        
        let nameString = try container.decodeIfPresent(String.self, forKey: .name)
        if let nameString = nameString {
            name = nameString
            // Set Image using name
            // https://www.thecocktaildb.com/images/ingredients/\(name).png
//            imageStringURL = "https://www.thecocktaildb.com/images/ingredients/\(name).png"
            imageStringURL = ""
        } else {
            name = "Unknown Name"
            // No name mean use default Image URL as placeholder
            imageStringURL = ""
        }
        
        let descriptionString = try container.decodeIfPresent(String.self, forKey: .description)
        if let descriptionString = descriptionString {
            description = descriptionString
        } else {
            description = "Uknown Description"
        }
        
        let typeString = try container.decodeIfPresent(String.self, forKey: .type)
        if let typeString = typeString {
            type = typeString
        } else {
            type = "Uknown Type"
        }
        
        let alcoholString = try container.decodeIfPresent(String.self, forKey: .hasAlcohol)
        if let alcoholString = alcoholString {
            if alcoholString == "Yes" {
                hasAlcohol = true
            }else {
                hasAlcohol = false
            }
        } else {
            hasAlcohol = false
        }
        
        let abvString = try container.decodeIfPresent(String.self, forKey: .abv)
        if let abvString = abvString {
            abv = abvString
        } else {
            abv = "Uknown Alcohol Percentage"
        }
    }
}

struct IngredientContainer: Codable {
    var ingredients: [Ingredient]
    
    enum CodingKeys: String, CodingKey {
        case ingredients
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ingredients = try container.decode([Ingredient].self, forKey: .ingredients)
    }
}


struct testIngredientList: Codable {
    var name: String?

    enum CodingKeys: String, CodingKey {
        case name = "strIngredient1"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}

struct testIngredientListContainer: Codable {
    var list: [testIngredientList]
    enum CodingKeys: String, CodingKey {
        case list = "drinks"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decode([testIngredientList].self, forKey: .list)
    }
}

