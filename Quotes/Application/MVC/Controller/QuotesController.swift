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
            case .success(let quoteInfo):
                DispatchQueue.main.async {
                    do {
                        let realm = try Realm()
                        
                        if let existingQuote = realm.objects(Quotes.self).filter("text == %@", quoteInfo.quoteText).first {
                            completion(.success(existingQuote))
                        } else {
                            let newQuote = Quotes()
                            newQuote.text = quoteInfo.quoteText
                            newQuote.category = quoteInfo.category
                            
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
            let quotes = realm.objects(Quotes.self).sorted(byKeyPath: "dataAdded", ascending: false)
            completion(.success(quotes))
        } catch {
            completion(.failure(error))
        }
    }
    
    func loadQuotes(forCategory category: String, completion: @escaping (Result<Results<Quotes>, Error>) -> Void) {
        do {
            let realm = try Realm()
            let quotes = realm.objects(Quotes.self).filter("category == %@", category).sorted(byKeyPath: "dataAdded", ascending: false)
            completion(.success(quotes))
        } catch {
            completion(.failure(error))
        }
    }
    
    func loadCategories(completion: @escaping (Result<[Category], Error>) -> Void) {
        NetworkManager.fetchCategories { [weak self] result in
            switch result {
            case .success(let categoryNames):
                DispatchQueue.main.async {
                    do {
                        let realm = try Realm()
                        try realm.write {
                            for categoryName in categoryNames {
                                let category = Category()
                                category.name = categoryName
                                realm.add(category, update: .modified)
                            }
                        }
                        let savedCategories = realm.objects(Category.self)
                        completion(.success(Array(savedCategories)))
                    } catch {
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}


