//
//  CategoryCell.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 03/02/2023.
//

import UIKit

enum ChevronIcon {
    static let down = UIImage(systemName: "chevron.down")!
    static let right = UIImage(systemName: "chevron.right")!
}

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var subCatView: UIView!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var arrowIcon: UIImageView!
    @IBOutlet weak var entriesTableView: UITableView!
    
    static let identifier: String = "CategoryCell"
    var entries: [Entry] = []
    
    override func awakeFromNib() {
        self.entriesTableView.setRadius()
        self.entriesTableView.delegate = self
        self.entriesTableView.dataSource = self
    }
    
    func configCellViews(with entry: [Entry]) {
        self.categoryLbl.text = entry.first?.category ?? ""
        self.entries = entry
        self.entriesTableView.reloadData()
    }
}

