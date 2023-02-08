//
//  EntriesCell.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 02/02/2023.
//

import UIKit

class EntriesCell: UITableViewCell {
    
    static let identifier: String = "EntriesCell"
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.setRadius()
        self.contentView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCellViews(with entry: Entry) {
        self.titleLbl.text = entry.api ?? ""
        self.descriptionLbl.text = entry.description
    }

}
