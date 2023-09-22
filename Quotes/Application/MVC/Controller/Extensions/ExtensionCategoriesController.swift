//
//  ExtensionCategoriesController.swift
//  Quotes
//
//  Created by Liz-Mary on 21.09.2023.
//

import Foundation
import UIKit


extension CategoriesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let category = categories[indexPath.row]
        DispatchQueue.main.async {
            cell.configure(with: category)
        }
        return cell
    }
}
