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
        quotesListView.tableView.estimatedRowHeight = 200 // Установите оценочную высоту
        quotesListView.tableView.rowHeight = UITableView.automaticDimension // Позволяет ячейкам изменять высоту автоматически
        
        setupTableView()
        loadQuotes()
    }
    
    func setupTableView() {
        
        quotesListView.tableView.delegate = self
        quotesListView.tableView.dataSource = self
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


extension ListQuotesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as! QuotesCell
        
        let quote = quotes?[indexPath.row]
        cell.quotesLabel.text = quote?.text ?? ""
        cell.detailTextLabel?.text = quote?.dataAdded.description
        
        return cell
    }
}

