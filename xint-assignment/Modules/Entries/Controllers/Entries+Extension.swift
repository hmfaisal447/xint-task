//
//  Entries+Extension.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 03/02/2023.
//

import Foundation
import UIKit

extension EntriesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - EntriesConstants.cellWidth.constant), height: self.viewModel.currentIndex == CGFloat(indexPath.item) ? self.viewModel.cellHeight : EntriesConstants.defaultCellHeight.constant)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.configCellViews(with: self.model[indexPath.item])
        cell.subCatView.isHidden = viewModel.currentIndex == CGFloat(indexPath.item) ? false : true
        cell.arrowIcon.image = viewModel.currentIndex == CGFloat(indexPath.item) ? ChevronIcon.right : ChevronIcon.down
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.currentIndex = viewModel.currentIndex == CGFloat(indexPath.item) ? EntriesConstants.defaultIndex.constant : CGFloat(indexPath.item)
        viewModel.cellHeight = viewModel.currentIndex == CGFloat(indexPath.item) ? EntriesConstants.expandableHeight.constant : EntriesConstants.defaultCellHeight.constant
        self.entriesCollectionView.reloadData()
    }
}
