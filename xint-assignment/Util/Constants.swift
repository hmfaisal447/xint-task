//
//  Constants.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 03/02/2023.
//

import Foundation

enum EntriesConstants {
    case cellWidth
    case expandableHeight
    case defaultIndex
    case defaultCellHeight
    case tableCellHeight
}

extension EntriesConstants {
    var constant: CGFloat {
        switch self {
            case .cellWidth:
                return 40
            case .expandableHeight:
                return 500
            case .defaultIndex:
                return -1
            case .defaultCellHeight:
                return 50
            case .tableCellHeight:
                return 70
        }
    }
}
