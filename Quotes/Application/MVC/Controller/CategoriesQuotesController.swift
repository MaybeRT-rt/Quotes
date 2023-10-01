//
//  CategoriesQuotesController.swift
//  Quotes
//
//  Created by Liz-Mary on 24.09.2023.
//

import Foundation
import UIKit
import RealmSwift

class CategoriesQuotesController: UIViewController {
    
    var selectedCategory: Category?
    var quotes: Results<Quotes>?
    var categoriesQV = CategoriesQuotesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = selectedCategory?.name.capitalized ?? "Category Quotes"
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadQuotesForSelectedCategory()
    }
    
    private func setupTableView() {
        categoriesQV.tableView.delegate = self
        categoriesQV.tableView.dataSource = self
        
        //categoriesQV.tableView.estimatedRowHeight = 200
        categoriesQV.tableView.allowsSelection = false
        
        categoriesQV.tableView.rowHeight = UITableView.automaticDimension
        
        categoriesQV.tableView.register(CategoriesQuotesOneCell.self, forCellReuseIdentifier: "OneQuoteCell")

        
        view.addSubview(categoriesQV.tableView)
        
        NSLayoutConstraint.activate([
            categoriesQV.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoriesQV.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesQV.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesQV.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func loadQuotesForSelectedCategory() {
        guard let selectedCategory = selectedCategory else { return }
        
        do {
            let realm = try Realm()
            quotes = realm.objects(Quotes.self).filter("category == %@", selectedCategory.name).sorted(byKeyPath: "dataAdded", ascending: false)
            categoriesQV.tableView.reloadData()
        } catch {
            print("Error loading quotes: \(error)")
        }
    }
}
