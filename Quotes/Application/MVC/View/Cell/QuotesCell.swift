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
        label.font = UIFont.systemFont(ofSize: 20.0)
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
    
    func setupCell() {
        addSubview(quotesLabel)
        
        NSLayoutConstraint.activate([
            quotesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            quotesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            quotesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            quotesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
