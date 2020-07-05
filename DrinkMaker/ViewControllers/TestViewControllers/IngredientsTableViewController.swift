//
//  IngredientsTableViewController.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 7/2/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//
// TODO: Reorder Ingredients with Capitlized and remove duplicates

import UIKit

class IngredientsTableViewController: UITableViewController {
    var ingredients: [String] = ["Light rum", "Applejack", "Gin", "Dark rum", "Sweet Vermouth", "Strawberry schnapps", "Scotch", "Apricot brandy", "Triple sec", "Southern Comfort", "Orange bitters", "Brandy", "Lemon vodka", "Blended whiskey", "Dry Vermouth", "Amaretto", "Tea", "Champagne", "Coffee liqueur", "Bourbon", "Tequila", "Vodka", "Añejo rum", "Bitters", "Sugar", "Kahlua", "demerara Sugar", "Dubonnet Rouge", "Lime juice", "Irish whiskey", "Apple brandy", "Carbonated water", "Cherry brandy", "Creme de Cacao", "Grenadine", "Port", "Coffee brandy", "Red wine", "Rum", "Grapefruit juice", "Ricard", "Sherry", "Cognac", "Sloe gin", "Apple juice", "Pineapple juice", "Lemon juice", "Sugar syrup", "Milk", "Strawberries", "Chocolate syrup", "Yoghurt", "Mango", "Ginger", "Lime", "Cantaloupe", "Berries", "Grapes", "Kiwi", "Tomato juice", "Cocoa powder", "Chocolate", "Heavy cream", "Galliano", "Peach Vodka", "Ouzo", "Coffee", "Spiced rum", "Water", "Espresso", "Angelica root", "Orange", "Cranberries", "Johnnie Walker", "Apple cider", "Everclear", "Cranberry juice", "Egg yolk", "Egg", "Grape juice", "Peach nectar", "Lemon", "Firewater", "Lemonade", "Lager", "Whiskey", "Absolut Citron", "Pisco", "Irish cream", "Ale", "Chocolate liqueur", "Midori melon liqueur", "Sambuca", "Cider", "Sprite", "7-Up", "Blackberry brandy", "Peppermint schnapps", "Creme de Cassis", "Jack Daniels"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.CustomBackgroundColor.dark
        tableView.allowsMultipleSelection = true
        
        ingredients = ingredients.sorted { $0.capitalized < $1.capitalized}
        
//        if #available(iOS 11.0, *) {
//            print("Showing")
//            navigationItem.hidesSearchBarWhenScrolling = false
//        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        setUpNavBar()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        if #available(iOS 11.0, *) {
//            print("Showing")
//            navigationItem.hidesSearchBarWhenScrolling = false
//        }
//
//        super.viewWillAppear(animated)
//            }
//
    override func viewDidAppear(_ animated: Bool) {
//        if #available(iOS 11.0, *) {
//            print("Hiding ")
//            navigationItem.hidesSearchBarWhenScrolling = true
//        }

        super.viewDidAppear(animated)

    }

    
    private func setUpNavBar() {
//        navigationController?.navigationBar.tintColor = UIColor.CustomBackgroundColor.light
//        navigationController?.navigationBar.backgroundColor = UIColor.CustomBackgroundColor.dark
//        navigationController?.navigationBar.barTintColor = UIColor.CustomBackgroundColor.dark
//        navigationController?.navigationBar.isTranslucent = true
//        navigationController?.navigationBar.barStyle = .default
        // Add Search Bar
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.searchBarStyle = .minimal
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController?.hidesNavigationBarDuringPresentation = true
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ingredients.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = ingredients[indexPath.row]
        cell.textLabel?.textColor = UIColor.TextColor.lightText
        cell.backgroundColor = UIColor.CustomBackgroundColor.dark
        cell.selectionStyle = .none
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
