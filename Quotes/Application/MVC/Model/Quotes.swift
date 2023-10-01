//
//  Quotes.swift
//  Quotes
//
//  Created by Liz-Mary on 17.09.2023.
//

import RealmSwift
import Foundation

class Quotes: Object {
    
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var text: String = ""
    @Persisted var category: String?
    @Persisted var dataAdded = Date()
    
}

