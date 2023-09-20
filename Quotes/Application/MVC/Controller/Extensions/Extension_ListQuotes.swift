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
        
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor =  UIColor(named: "Color 2")?.cgColor //
        
        let quote = quotes?[indexPath.row]
        cell.quotesLabel.text = quote?.text ?? ""
        cell.detailTextLabel?.text = quote?.dataAdded.description
        
        return cell
    }
}

