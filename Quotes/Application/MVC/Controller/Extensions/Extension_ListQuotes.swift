//
//  Extension_ListQuotes.swift
//  Quotes
//
//  Created by Liz-Mary on 20.09.2023.
//

import UIKit

extension ListQuotesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = FooterViewCell()
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as! QuotesCell
        
        let quote = quotes?[indexPath.row]
        cell.quotesLabel.text = quote?.text ?? ""
        
        if let date = quote?.dataAdded {
            cell.quotesDataLabel.text = DateFormat.formatDate(date)
        } else {
            cell.quotesDataLabel.text = ""
        }
        
        cell.quotesCategotyLabel.text = quote?.category        
        return cell
    }
}

