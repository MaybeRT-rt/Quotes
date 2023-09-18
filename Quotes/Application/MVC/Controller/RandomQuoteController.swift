//
//  RandomQuoteController.swift
//  Quotes
//
//  Created by Liz-Mary on 17.09.2023.
//

import Foundation
import UIKit

class RandomQuoteController: UIViewController {
    
    let randomQuoteView = RandomQuoteView()
    let quoteController = QuotesController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        randomQuoteView.frame = view.bounds
    }
    
    func setupUI() {
        view.addSubview(randomQuoteView)
        randomQuoteView.quoteLoadButton.addTarget(self, action: #selector(loadRandomQuote), for: .touchUpInside)
    }
    
    @objc func loadRandomQuote() {
        randomQuoteView.activityIndicator.startAnimating()
        quoteController.loadRandomQuote { [weak self] result in
            switch result {
            case .success(let quote):
                DispatchQueue.main.async {
                    self?.randomQuoteView.activityIndicator.stopAnimating()
                    self?.randomQuoteView.quoteLabel.text = quote.text
                }
            case .failure(let error):
                print("Error loading random quote: \(error)")
            }
        }
    }
}

