//
//  CategoryCell+Extension.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 03/02/2023.
//

import Foundation
import UIKit

extension CategoryCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return EntriesConstants.tableCellHeight.constant
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EntriesCell.identifier, for: indexPath) as! EntriesCell
        cell.configCellViews(with: self.entries[indexPath.item])
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "📌") { [weak self] (action, view, completionHandler) in
            guard let self else {return}
            self.handleMarkAsFavourite()
            completionHandler(true)
        }
        action.backgroundColor = .systemBlue.withAlphaComponent(0.6)
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    private func handleMarkAsFavourite() {
        print("do something")
    }
}

