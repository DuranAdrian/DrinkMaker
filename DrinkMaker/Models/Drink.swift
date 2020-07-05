//
//  Drink.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/17/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import Foundation

struct Drink: Codable {
    var id: String
    var name: String
    var tags: [String] // Would need to seperate into an array
    var category: CategoryType
    var hasAlcohol: Bool
    var glass: GlassType
    var instructions: String // Would need to seperate into an array
    var imageUrl: String
    
    var ingredients: [String] = []
    var measurements: [String] = []
    var dateModified: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case tags = "strTags"
        case category = "strCategory"
        case hasAlcohol = "strAlcoholic"
        case glass = "strGlass"
        case instructions = "strInstructions"
        case imageUrl = "strDrinkThumb"
        case dateModified
    }
    
    enum IngredientKeys: String, CodingKey {
        // INGREDIENTS
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
    }
    
    enum MeasurementKeys: String, CodingKey {
        case measurement1 = "strMeasure1"
        case measurement2 = "strMeasure2"
        case measurement3 = "strMeasure3"
        case measurement4 = "strMeasure4"
        case measurement5 = "strMeasure5"
        case measurement6 = "strMeasure6"
        case measurement7 = "strMeasure7"
        case measurement8 = "strMeasure8"
        case measurement9 = "strMeasure9"
        case measurement10 = "strMeasure10"
        case measurement11 = "strMeasure11"
        case measurement12 = "strMeasure12"
        case measurement13 = "strMeasure13"
        case measurement14 = "strMeasure14"
        case measurement15 = "strMeasure15"
    }
    
    // Instead of making all values optional, we will decodeIfPresent and give an actual value to variable
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let idString = try container.decodeIfPresent(String.self, forKey: .id)
        if let idString = idString {
            id = idString
        } else {
            id = "Drink has no ID"
        }
        
        let nameString = try container.decodeIfPresent(String.self, forKey: .name)
        if let nameString = nameString {
            name = nameString
        } else {
            name = "Drink has no name"
        }

        let tagString = try container.decodeIfPresent(String.self, forKey: .tags)
        if let tagString = tagString {
            tags = tagString.components(separatedBy: ",")
        } else {
            tags = []
        }
        
        let categoryCT = try container.decodeIfPresent(CategoryType.self, forKey: .category)
        if let categoryTag = categoryCT {
            category = categoryTag
        } else {
            category = .otherUnknown
        }
        
        // TODO: Figure out way to determine default value in case value is not present
        let alcoholicString = try container.decodeIfPresent(String.self, forKey: .hasAlcohol)
        if let alcoholicString = alcoholicString {
            if alcoholicString == "Alcoholic" || alcoholicString == "Optional alcohol" {
                hasAlcohol = true
            } else {
                hasAlcohol = false
            }
        } else {
            hasAlcohol = false
        }
        
        let typeOfGlass = try container.decodeIfPresent(String.self, forKey: .glass)
        if let typeOfGlass = typeOfGlass {
            print("Glass type: \(typeOfGlass)")
            glass = GlassType.init(rawValue: typeOfGlass.capitalized)!
        } else {
            glass = .unknown
        }
        
        let instructionsString = try container.decodeIfPresent(String.self, forKey: .instructions)
        if let instructionsString = instructionsString {
            instructions = instructionsString
        } else {
            instructions = "No Intructions Found"
        }

        
        
        imageUrl = try container.decode(String.self, forKey: .imageUrl)
        
        // INGREDIENTS
        let ingredientContainer = try decoder.container(keyedBy: IngredientKeys.self)
        let ingredient1 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient1)
        if let i1 = ingredient1 { ingredients.append(i1)}
        let ingredient2 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient2)
        if let i2 = ingredient2 { ingredients.append(i2)}
        let ingredient3 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient3)
        if let i3 = ingredient3 { ingredients.append(i3)}
        let ingredient4 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient4)
        if let i4 = ingredient4 { ingredients.append(i4)}
        let ingredient5 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient5)
        if let i5 = ingredient5 { ingredients.append(i5)}
        let ingredient6 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient6)
        if let i6 = ingredient6 { ingredients.append(i6)}
        let ingredient7 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient7)
        if let i7 = ingredient7 { ingredients.append(i7)}
        let ingredient8 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient8)
        if let i8 = ingredient8 { ingredients.append(i8)}
        let ingredient9 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient9)
        if let i9 = ingredient9 { ingredients.append(i9)}
        let ingredient10 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient10)
        if let i10 = ingredient10 { ingredients.append(i10)}
        let ingredient11 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient11)
        if let i11 = ingredient11 { ingredients.append(i11)}
        let ingredient12 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient12)
        if let i12 = ingredient12 { ingredients.append(i12)}
        let ingredient13 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient13)
        if let i13 = ingredient13 { ingredients.append(i13)}
        let ingredient14 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient14)
        if let i14 = ingredient14 { ingredients.append(i14)}
        let ingredient15 = try ingredientContainer.decodeIfPresent(String.self, forKey: .ingredient15)
        if let i15 = ingredient15 { ingredients.append(i15)}

        // MEASUREMENTS
        let measurementContainer = try decoder.container(keyedBy: MeasurementKeys.self)
        let measurement1 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement1)
        if let m1 = measurement1 { measurements.append(m1)}
        let measurement2 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement2)
        if let m2 = measurement2 { measurements.append(m2)}
        let measurement3 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement3)
        if let m3 = measurement3 { measurements.append(m3)}
        let measurement4 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement4)
        if let m4 = measurement4 { measurements.append(m4)}
        let measurement5 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement5)
        if let m5 = measurement5 { measurements.append(m5)}
        let measurement6 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement6)
        if let m6 = measurement6 { measurements.append(m6)}
        let measurement7 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement7)
        if let m7  = measurement7 { measurements.append(m7)}
        let measurement8 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement8)
        if let m8 = measurement8 { measurements.append(m8)}
        let measurement9 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement9)
        if let m9 = measurement9 { measurements.append(m9)}
        let measurement10 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement10)
        if let m10 = measurement10 { measurements.append(m10)}
        let measurement11 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement11)
        if let m11 = measurement11 { measurements.append(m11)}
        let measurement12 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement12)
        if let m12 = measurement12 { measurements.append(m12)}
        let measurement13 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement13)
        if let m13 = measurement13 { measurements.append(m13)}
        let measurement14 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement14)
        if let m14 = measurement14 { measurements.append(m14)}
        let measurement15 = try measurementContainer.decodeIfPresent(String.self, forKey: .measurement15)
        if let m15 = measurement15 { measurements.append(m15)}

        let lastDateModified = try container.decodeIfPresent(String.self, forKey: .dateModified)
        if let lastDateModified = lastDateModified {
            dateModified = lastDateModified
        } else {
            dateModified = "Last Date Modified is Unknown"
        }
        
    }
    
    init() {
        id = "Unknown ID"
        name = "Unknown Name"
        tags = ["Unknown Tags"]
        category = .otherUnknown
        hasAlcohol = false
        glass = .unknown
        instructions = "Unknown Instructions"
        imageUrl = "Unknown Image URL"
        dateModified = "Unknown last Date Modified"
    }
    init(id: String, name: String, tags: [String], category: CategoryType, hasAlcohol: Bool, glass: GlassType, instructions: String, imageUrl: String, ingredients: [String], measurements: [String], dateModified: String) {
        self.id = id
        self.name = name
        self.tags = tags
        self.category = category
        self.hasAlcohol = hasAlcohol
        self.glass = glass
        self.instructions = instructions
        self.imageUrl = imageUrl
        self.ingredients = ingredients
        self.measurements = measurements
        self.dateModified = dateModified

    }
    // A Drink cannot exist without an ID, so if id is uknown, drink does not exist.
    var isNonExistant: Bool  {
        get {
            return id == "Unknown ID"
        }
    }
    
    func combineMeasurementsIngredients() -> [String] {
        // Ingredients will always have the same or greater count than measurements
        var modifiedList: [String] = []
        
        for (index, item) in ingredients.enumerated() {
            var combinedString: String = ""
            if measurements.indices.contains(index) {
                combinedString.append(measurements[index])
            }
            combinedString.append(item)
            
            modifiedList.append(combinedString)
        }
        
        return modifiedList
    }
}

enum GlassType: String, Codable, CaseIterable {
//    case highballglass = "Highball glass"
    case highballGlass = "Highball Glass"
//    case cocktailglass = "Cocktail glass"
    case cocktailGlass = "Cocktail Glass"
//    case oldfashionedglass = "Old-fashioned glass"
    case oldFashionedGlass = "Old-Fashioned glass"
//    case collinsglass = "Collins glass"
    case collinsGlass = "Collins Glass"
    case pousseCafeGlass = "Pousse Cafe Glass"
    case champagneFlute = "Champagne Flute"
    case whiskeySourGlass = "Whiskey Sour Glass"
    case brandySnifter = "Brandy Snifter"
    case whiteWineGlass = "White Wine Glass"
    case nickAndNoraGlass = "Nick and Nora Glass"
    case hurricaneGlass = "Hurricane Glass"
//    case hurricaneglass = "Hurricane glass"
//    case coffeemug = "Coffee mug"
    case coffeeMug = "Coffee Mug"
//    case shotglass = "Shot glass"
    case shotGlass = "Shot Glass"
    case jar = "Jar"
    case irishCoffeeCup = "Irish Coffee Cup"
//    case irishcoffeecup = "Irish coffee cup"
    case punchBowl = "Punch Bowl"
//    case punchbowl = "Punch bowl"
    case pitcher = "Pitcher"
    case pintGlass = "Pint Glass"
    case copperMug = "Copper Mug"
    case wineGlass = "Wine Glass"
    case cordialGlass = "Cordial Glass"
    case beerMug = "Beer Mug"
    case margaritaCoupetteGlass = "Margarita/Coupette Glass"
    case beerPilsner = "Beer Pilsner"
    case beerGlass = "Beer Glass"
    case parfaitGlass = "Parfair glass"
    case masonJar = "Mason Jar"
    case margaritaGlass = "Margarita Glass"
    case martiniGlass = "Martini Glass"
    case balloonGlass = "Balloon Glass"
    case coupeGlass = "Couple Glass"
    case unknown = ""
    
    var description: String {
        get {
            return self.rawValue
        }
    }
    
    var serveDescription: String {
        get {
            return "Serve in a \(self.capitalizedDescription)"
        }
    }
    
    var capitalizedDescription: String {
        return self.rawValue.capitalized
    }
    
    var apiFriendlyString: String {
        return self.rawValue.replacingOccurrences(of: " ", with: "_")
    }
}

enum CategoryType: String, Codable, CaseIterable {
    case ordinaryDrink = "Ordinary Drink"
    case cocktail = "Cocktail"
    case milkFloatShake = "Milk / Float / Shake"
    case otherUnknown = "Other/Unknown"
    case cocoa = "Cocoa"
    case shot = "Shot"
    case coffeeTea = "Coffee / Tea"
    case homemadeLiqueur = "Homemade Liqueur"
    case punchPartyDrink = "Punch / Party Drink"
    case beer = "Beer"
    case softDrinkSoda = "Soft Drink / Soda"
    
    var description: String {
        get {
            return self.rawValue
        }
    }
    
    var apiFriendlyString: String {
        return self.rawValue.replacingOccurrences(of: " ", with: "_")
//        switch self {
//            case .ordinaryDrink:
//            return "Ordinary_Drink"
//            case .milkFloatShake:
//                return "Milk_/_Float_/_Shake"
//            case .coffeeTea:
//            return "Coffee_/_Tea"
//            case .homemadeLiqueur:
//                return "Homemade_Liqueur"
//            case .punchPartyDrink:
//                return "Punch_/_Party_Drink"
//            case .punchPartyDrink:
//                return "Soft_Drink_/_Soda"
//            default:
//            return description
//        }
    }
}

struct DrinkContainer {
    var drinks: [Drink]
}
extension DrinkContainer: Decodable {
    enum CodingKeys: String, CodingKey {
        case drinks
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        drinks = try container.decode([Drink].self, forKey: .drinks)
    }
}
