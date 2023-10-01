//
//  NetworkManager.swift
//  Quotes
//
//  Created by Liz-Mary on 17.09.2023.
//

import Foundation

class NetworkManager {
    
    static func fetchRandomQuotes(completion: @escaping(Result<(quoteText: String, category: String), Error>) -> Void) {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
            completion(.failure(NSError(domain: "InvalidURL", code: 0)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                let quoteText = json["value"] as? String else {
                completion(.failure(NSError(domain: "ParsingError", code: 0)))
                return
            }
            
            let categories = json["categories"] as? [String]
            let category = categories?.first ?? "Uncategorized"
            
            let result = (quoteText: quoteText, category: category.capitalized)
            completion(.success(result))
        }
        .resume()
    }


    
    static func fetchCategories(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/categories") else {
            completion(.failure(NSError(domain: "InvalidURL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data,
                  let categories = try? JSONSerialization.jsonObject(with: data, options: []) as? [String] else {
                completion(.failure(NSError(domain: "ParsingError", code: 0, userInfo: nil)))
                return
            }
            
            completion(.success(categories))
        }
        .resume()
    }
}
