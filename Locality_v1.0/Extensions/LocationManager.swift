//
//  LocationManager.swift
//  Locality_v1.0
//
//  Created by Varun Nair on 7/17/23.
//

import SwiftUI
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    
    var currentLocation: CLLocation? {
        return locationManager.location
    }
    
    override init() {
        
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard !locations.isEmpty else { return }
        locationManager.stopUpdatingLocation()
    }
}
