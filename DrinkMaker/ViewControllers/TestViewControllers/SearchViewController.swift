//
//  SearchViewController.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/29/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//
//TODO: Add Clear All Filters

import UIKit
import TagListView

class SearchViewController: UIViewController {
    @IBOutlet weak var searchToggle: UISwitch!
    @IBOutlet weak var categoryTagView: TagListView!
    @IBOutlet weak var ingredientTagView: TagListView!
    @IBOutlet weak var glassTypeTagView: TagListView!
    @IBOutlet weak var searchButton: SearchButton!
    @IBOutlet weak var searchIngredientsButton: SearchButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        categoryTagView.delegate = self
        categoryTagView.tagSelectedBackgroundColor = UIColor.CustomBackgroundColor.yellow
        
        categoryTagView.textFont = UIFont.init(name: "Lato-Regular", size: 17.0)!
        categoryTagView.addTags(CategoryType.allCases.map {$0.rawValue})
        ingredientTagView.addTags(["Light rum", "Applejack", "Gin", "Dark rum", "Sweet Vermouth", "Strawberry schnapps", "Scotch", "Apricot brandy", "Triple sec", "Southern Comfort", "Orange bitters", "Brandy", "Lemon vodka", "Blended whiskey", "Dry Vermouth", "Amaretto", "Tea", "Champagne", "Coffee liqueur", "Bourbon", "Tequila", "Vodka", "Añejo rum", "Bitters"]
)
        glassTypeTagView.addTags(GlassType.allCases.map {$0.rawValue != "" ? $0.rawValue : "Uknown"})
        NetworkManager().ingredients.getListOfIngredients(completion: {list, error in
            if let error = error {
                print("WHOOPS")
            }
            if let list = list {
                var array: [String] = []
                for item in list {
                    array.append(item.name!)
                }
                print(array)
            }
        })
        
        searchIngredientsButton.addTarget(self, action: #selector(showIngredientsTableView(_:)), for: .touchUpInside)
        view.backgroundColor = UIColor.CustomBackgroundColor.dark
        searchButton.addTarget(self, action: #selector(searchDrinks(_:)), for: .touchUpInside)
        setUpNavBar()
    }
    
    private func setUpNavBar() {
        navigationController?.navigationBar.backgroundColor = UIColor.CustomBackgroundColor.dark
        navigationController?.navigationBar.barTintColor = UIColor.CustomBackgroundColor.dark
        navigationController?.navigationBar.isTranslucent = true
        
        let searchControl = UISearchController(searchResultsController: nil)
        searchControl.delegate = self
//        searchControl.searchResultsUpdater = self
        searchControl.hidesNavigationBarDuringPresentation = false
        searchControl.searchBar.searchBarStyle = .minimal
        navigationItem.searchController = searchControl
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func showIngredientsTableView(_ sender: UIButton) {
        let vc = IngredientsTableViewController()
//        navigationItem.searchController?.hidesNavigationBarDuringPresentation = false
        vc.navigationItem.title = "Choose Ingredients"
//        let searchController = UISearchController()
//        searchController.hidesNavigationBarDuringPresentation = false
//        searchController.searchBar.searchBarStyle = .minimal
//        vc.navigationItem.searchController = searchController
//        vc.navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension SearchViewController: UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController) {
//        navigationController?.navigationBar.isTranslucent = false
    }
    func willDismissSearchController(_ searchController: UISearchController) {
//        navigationController?.navigationBar.isTranslucent = true
    }
}

extension SearchViewController: TagListViewDelegate {
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        if sender == categoryTagView {
            // Allow User to select any category tag
            tagView.isSelected = !tagView.isSelected
        }
        
    }
    
    @objc func searchDrinks(_ sender: UIButton) {
        print("Category Selection")
        for item in categoryTagView.selectedTags() {
            print(item.currentTitle!)
        }
    }
    
}
