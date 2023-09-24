//
//  CategoriesQuotesOneCell.swift
//  Quotes
//
//  Created by Liz-Mary on 24.09.2023.
//

import Foundation
import UIKit

class CategoriesQuotesOneCell: UITableViewCell {
    
    let quotesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "Color 2")
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
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
        
        NSLayoutConstraint.activate([
            quotesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            quotesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            quotesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            quotesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        
        ])
    }
}
