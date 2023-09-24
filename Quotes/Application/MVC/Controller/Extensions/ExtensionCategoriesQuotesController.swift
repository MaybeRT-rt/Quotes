//
//  ExtensionCategoriesQuotesController.swift
//  Quotes
//
//  Created by Liz-Mary on 24.09.2023.
//

import Foundation
import UIKit

extension CategoriesQuotesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OneQuoteCell", for: indexPath) as! CategoriesQuotesOneCell
        if let quote = quotes?[indexPath.row] {
            cell.quotesLabel.text = quote.text
        }
        return cell
    }
}
