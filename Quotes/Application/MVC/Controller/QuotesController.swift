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
    //    
    //    func loadCategories(completion: @escaping (Result<[Category], Error>) -> Void) {
    //        do {
    //            let realm = try Realm()
    //            // Загрузите все цитаты из базы данных Realm
    //            let allQuotes = realm.objects(Quotes.self)
    //            
    //            // Создайте множество для хранения уникальных категорий
    //            var uniqueCategories = Set<String>()
    //            
    //            for quote in allQuotes {
    //                // Если у цитаты есть категория, добавьте ее в множество
    //                if let category = quote.category {
    //                    uniqueCategories.insert(category)
    //                }
    //            }
    //            
    //            // Создайте объекты Category на основе уникальных категорий
    //            var categoriesToAdd: [Category] = []
    //            for categoryName in uniqueCategories {
    //                let newCategory = Category()
    //                newCategory.name = categoryName
    //                categoriesToAdd.append(newCategory)
    //            }
    //            
    //            try realm.write {
    //                // Добавьте только новые категории в базу данных
    //                realm.add(categoriesToAdd, update: .modified)
    //            }
    //            
    //            // Загрузите сохраненные категории и верните их
    //            let savedCategories = realm.objects(Category.self)
    //            completion(.success(Array(savedCategories)))
    //        } catch {
    //            completion(.failure(error))
    //        }
    //    }
    //}
    func loadCategories(completion: @escaping (Result<[Category], Error>) -> Void) {
        do {
            let realm = try Realm()
            // Загрузите все цитаты из базы данных Realm
            let allQuotes = realm.objects(Quotes.self)
            
            // Создайте множество для хранения уникальных категорий
            var uniqueCategories = Set<String>()
            
            for quote in allQuotes {
                // Если у цитаты есть категория, добавьте ее в множество
                if let category = quote.category {
                    uniqueCategories.insert(category)
                } else {
                    // Если у цитаты нет категории, добавьте "Uncategorized" в уникальные категории
                    uniqueCategories.insert("Uncategorized")
                }
            }
            
            // Создайте объекты Category на основе уникальных категорий
            var categoriesToAdd: [Category] = []
            for categoryName in uniqueCategories {
                let newCategory = Category()
                newCategory.name = categoryName
                categoriesToAdd.append(newCategory)
            }
            
            try realm.write {
                // Добавьте только новые категории в базу данных
                realm.add(categoriesToAdd, update: .modified)
            }
            
            // Загрузите сохраненные категории и верните их
            let savedCategories = realm.objects(Category.self)
            completion(.success(Array(savedCategories)))
        } catch {
            completion(.failure(error))
        }
    }
}
