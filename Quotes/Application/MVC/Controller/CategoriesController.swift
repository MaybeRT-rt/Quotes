//
//  CategoriesController.swift
//  Quotes
//
//  Created by Liz-Mary on 17.09.2023.
//

import Foundation
import UIKit
import RealmSwift
import Realm

class CategoriesController: UIViewController {
    
    private let categoryView = CategoriesView()
    var categories: [Category] = []
    
    override func loadView() {
        view = categoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Categories"
        setupTableView()
        loadCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCategories()
    }

    
    private func setupTableView() {
        
        categoryView.tableView.delegate = self
        categoryView.tableView.dataSource = self
        
        categoryView.tableView.rowHeight = UITableView.automaticDimension
        categoryView.tableView.register(CategoryCell.self, forCellReuseIdentifier: "CategoryCell")
        
        view.addSubview(categoryView.tableView)
        
        NSLayoutConstraint.activate([
            categoryView.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryView.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryView.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            categoryView.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func loadCategories() {
        let quotesController = QuotesController()
        quotesController.loadCategories { [weak self] result in
            switch result {
            case .success(let categories):
                self?.categories = categories
                
                DispatchQueue.main.async {
                    self?.categoryView.tableView.reloadData()
                }
            case .failure(let error):
                print("Error loading categories: \(error)")
            }
        }
    }
}
