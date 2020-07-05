//
//  NetworkManager.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/17/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import Foundation
class NetworkManager {
    public let apiKey: String = "1"
    public var decoder = JSONDecoder()
    public lazy var drinks = DrinkAPI()
    public lazy var ingredients = IngredientAPI()
}
