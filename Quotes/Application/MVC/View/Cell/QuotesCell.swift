//
//  QuotesCell.swift
//  Quotes
//
//  Created by Liz-Mary on 19.09.2023.
//

import Foundation
import UIKit

class QuotesCell: UITableViewCell {
    
    let quotesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "Color 2")
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        label.numberOfLines = 0
        return label
    }()
    
    let quotesDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor(named: "Color 1")
        label.numberOfLines = 0
        return label
    }()
    
    var quotesCategotyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "Color 1")
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        addSubview(quotesLabel)
        addSubview(quotesDataLabel)
        addSubview(quotesCategotyLabel)
        
        NSLayoutConstraint.activate([
            quotesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            quotesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            quotesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            quotesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35),
            

            quotesDataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            quotesDataLabel.topAnchor.constraint(equalTo: quotesLabel.bottomAnchor, constant: 10),
            
            quotesCategotyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            quotesCategotyLabel.trailingAnchor.constraint(equalTo: quotesDataLabel.trailingAnchor),
            quotesCategotyLabel.topAnchor.constraint(equalTo: quotesLabel.bottomAnchor, constant: 10)
            
        ])
    }
    
    func setCategoryColor() {
        quotesCategotyLabel.textColor = UIColor(named: "Color 1")
    }
}
