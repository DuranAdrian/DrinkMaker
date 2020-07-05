//
//  SingleDrinkViewController.swift
//  DrinkMaker
//
//  Created by Adrian Duran on 6/19/20.
//  Copyright © 2020 AdrianDuran. All rights reserved.
//

import UIKit

class SingleDrinkViewController: UIViewController {
    var drink = Drink()
    
    var instructionsList: [String] = ["3 cups Water", "1 cup Sugar", "12 Cloves", "2 Cinnamon", "1 Lemon peel", "750 ml Red wine", "1/4 cup Brandy"]
    lazy var drinkView: DrinkView = {
        let view = DrinkView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.ingredientTableView.delegate = self
        view.ingredientTableView.dataSource = self
//        view.ingredientTableView.register(UINib.init(nibName: "IngredientCell", bundle: nil), forCellReuseIdentifier: "IngredientCell")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(drinkView)
        drinkView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive = true
        drinkView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0.0).isActive = true
        drinkView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0.0).isActive = true
        drinkView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0).isActive = true
        drinkView.drinkNameLabel.text = drink.name
        drinkView.ingredientTableView.register(UINib.init(nibName: "IngredientCell", bundle: nil), forCellReuseIdentifier: "IngredientCell")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        drinkView.modifyNameLabel()
        drinkView.invalidateIntrinsicContentSize()
        drinkView.scrollView.setNeedsLayout()
        drinkView.scrollView.layoutIfNeeded()
        view.setNeedsLayout()
        view.layoutIfNeeded()
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

extension SingleDrinkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instructionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
        cell.setUpCell()
        
        cell.bulletView.backgroundColor = .lightGray
        cell.Ingredient.text = instructionsList[indexPath.row]
        print(cell.frame)
        return cell
    }
    
    
}
