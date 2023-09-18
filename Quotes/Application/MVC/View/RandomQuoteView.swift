//
//  RandomQuoteView.swift
//  Quotes
//
//  Created by Liz-Mary on 17.09.2023.
//

import Foundation
import UIKit

class RandomQuoteView: UIView {
    
    let quoteLabel: UILabel = {
        let quoteLabel = UILabel()
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.textAlignment = .center
        quoteLabel.numberOfLines = 0
        return quoteLabel
    }()
    
    let quoteLoadButton: UIButton = {
        let loadButton = UIButton()
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        loadButton.setTitle("Загрузить цитату", for: .normal)
        loadButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        loadButton.setTitleColor(UIColor(named: "Color 2"), for: .normal)
        loadButton.backgroundColor = UIColor(named: "Color 1")
        
        loadButton.layer.cornerRadius = 10
        
        return loadButton
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Image")
        return imageView
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = UIColor(named: "Color")
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(quoteLabel)
        addSubview(quoteLoadButton)
        addSubview(imageView)
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.bottomAnchor.constraint(equalTo: quoteLabel.topAnchor , constant: 0),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            
            quoteLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            quoteLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            quoteLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            quoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            quoteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            activityIndicator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            activityIndicator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            quoteLoadButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            quoteLoadButton.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 10),
            quoteLoadButton.widthAnchor.constraint(equalToConstant: 200),
            quoteLoadButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
