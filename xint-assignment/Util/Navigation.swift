//
//  Navigation.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 02/02/2023.
//

import Foundation
import UIKit

enum AppStoryboard : String {
  case Main, Entries
    
  var shared : UIStoryboard {
    return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
  }
    
}

extension UIViewController {
    static func initFromStoryboard(_ board: AppStoryboard) -> UIViewController {
        return board.shared.instantiateViewController(withIdentifier: "\(self)")
    }
}
