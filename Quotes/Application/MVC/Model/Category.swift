//
//  Category.swift
//  Quotes
//
//  Created by Liz-Mary on 17.09.2023.
//

import Foundation
import RealmSwift

class Category: Object {
    @Persisted(primaryKey: true) var name: String = ""
    let quotes = List<Quotes>()
}
