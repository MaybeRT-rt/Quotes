//
//  QuotesController.swift
//  Quotes
//
//  Created by Liz-Mary on 17.09.2023.
//

import Foundation
import RealmSwift

class QuotesController {
    
    private var categories: [String] = []
    
    func loadRandomQuote(completion: @escaping (Result<Quotes, Error>) -> Void) {
        NetworkManager.fetchRandomQuotes { result in
            switch result {
            case .success(let quoteText):
                DispatchQueue.main.async {
                    do {
                        let realm = try Realm()
                        
                        if let existingQuote = realm.objects(Quotes.self).filter("text == %@", quoteText).first {
                            completion(.success(existingQuote))
                        } else {
                            let newQuote = Quotes()
                            newQuote.text = quoteText
                            
                            if let category = self.determineCategory(for: quoteText) {
                                newQuote.category = category
                            }
                            
                            try realm.write {
                                realm.add(newQuote)
                            }
                            
                            completion(.success(newQuote))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }


    func loadAllQuotes(completion: @escaping (Result<Results<Quotes>, Error>) -> Void) async {
        do {
            let realm = try await Realm()
            let quotes = realm.objects(Quotes.self).sorted(byKeyPath: "dateAdded", ascending: false)
            completion(.success(quotes))
        } catch {
            completion(.failure(error))
        }
    }
    
//    func loadCategories(completion: @escaping (Result<[String], Error>) -> Void) async {
//        do {
//            let categories = try await NetworkManager.fetchCategories()
//            self.categories = categories
//            completion(.success(categories))
//        } catch {
//            completion(.failure(error))
//        }
//    }
//    
    private func determineCategory(for quoteText: String) -> String? {
        let categories = [
            "animal", "career", "celebrity", "dev", "explicit", "fashion", "food",
            "history", "money", "movie", "music", "political", "religion", "science",
            "sport", "travel"
        ]
        
        if let randomCategory = categories.randomElement() {
            return randomCategory
        } else {
            return "Uncategorized"
        }
    }
}
