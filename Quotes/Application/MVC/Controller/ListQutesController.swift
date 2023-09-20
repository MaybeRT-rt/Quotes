//
//  ListQutesController.swift
//  Quotes
//
//  Created by Liz-Mary on 17.09.2023.
//

import Foundation
import UIKit
import RealmSwift

class ListQuotesController: UIViewController {
    
    let quotesListView = ListQuotesView()
    var quotes: Results<Quotes>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "List of all quotes"
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadQuotes()
    }
    
    func setupTableView() {
        
        quotesListView.tableView.delegate = self
        quotesListView.tableView.dataSource = self
        quotesListView.tableView.estimatedRowHeight = 200
        quotesListView.tableView.allowsSelection = false
        quotesListView.tableView.rowHeight = UITableView.automaticDimension
        quotesListView.tableView.register(QuotesCell.self, forCellReuseIdentifier: "QuoteCell")
        
        view.addSubview(quotesListView.tableView)
        
        NSLayoutConstraint.activate([
            quotesListView.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quotesListView.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            quotesListView.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            quotesListView.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func loadQuotes() {
        do {
            let realm = try Realm()
            quotes = realm.objects(Quotes.self).sorted(byKeyPath: "dataAdded", ascending: false)
            quotesListView.tableView.reloadData()
        } catch {
            print("Error loading quotes: \(error)")
        }
    }
}


