//
//  Util.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 02/02/2023.
//

import Foundation
import UIKit

public class Util {
    class func showAlert(caller:UIViewController,title:String? = "Error",message:String) -> Void {
        DispatchQueue.main.async {
            let alert = UIAlertController(title:title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            caller.present(alert, animated: true, completion: nil)
        }
    }
    
    class func unique<S : Sequence, T : Hashable>(source: S) -> [T] where S.Iterator.Element == T {
        var buffer = [T]()
        var added = Set<T>()
        for elem in source {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}

extension UIView {
    func setRadius(with value: CGFloat = 10) {
        self.layer.cornerRadius = value
        self.clipsToBounds = true
    }
}
