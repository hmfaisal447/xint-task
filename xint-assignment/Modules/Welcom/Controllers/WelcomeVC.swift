//
//  WelcomeVC.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 02/02/2023.
//

import UIKit
import MapKit

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var loadBtn: UIButton!
    @IBOutlet weak var coordinatesLbl: UILabel!
    
    private lazy var viewModel = WelcomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadBtn.setRadius()
        self.viewModel.delegate = self
    }
    
    @IBAction func didTabLoadData(_ sender: UIButton) {
        let vc = EntriesVC.initFromStoryboard(.Entries)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension WelcomeVC: LocationDelegate {
    func didUpdateLocation(with location: CLLocation?) {
        if let location {
            self.coordinatesLbl.text = "Latitude:\(location.coordinate.latitude),\nLongitude:\(location.coordinate.longitude)"
        }
    }
}
