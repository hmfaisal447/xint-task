//
//  WelcomeViewModel.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 02/02/2023.
//

import Foundation
import UIKit
import CoreLocation

protocol LocationDelegate: AnyObject {
    func didUpdateLocation(with location: CLLocation?)
}

class WelcomeViewModel: NSObject {
    
    private let locationManager = CLLocationManager()
    weak var delegate: LocationDelegate?
    
    override init() {
        super.init()
        self.userLocaiton()
    }

}

extension WelcomeViewModel: CLLocationManagerDelegate {
    
    private func userLocaiton() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        DispatchQueue.global().async { [weak self] in
            guard let self else {return}
            self.locationEnable()
        }
    }
    
    private func locationEnable() {
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.delegate?.didUpdateLocation(with: manager.location)
    }
}
