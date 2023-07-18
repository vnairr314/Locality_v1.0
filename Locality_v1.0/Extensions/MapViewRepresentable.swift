//
//  LocationExtension.swift
//  Locality_v1.0
//
//  Created by Varun Nair on 7/17/23.
//

import SwiftUI
import Foundation
import MapKit

class MapViewModel: ObservableObject {
    @Published var mapView = MKMapView()
    @Published var region: MKCoordinateRegion? = nil
    let locationManager = LocationManager()
}

struct MapViewRepresentable: UIViewRepresentable {
    
    @Binding var mapView: MKMapView
    @Binding var region: MKCoordinateRegion?
    
    let locationManager: LocationManager
    
    func makeUIView(context: Context) -> some UIView {
        
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        if let region = region {
            mapView.setRegion(region, animated: true)
        } else if let userLocation = locationManager.currentLocation {
            let newRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                                               span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            mapView.setRegion(newRegion, animated: true)
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
    
}

extension MapViewRepresentable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        
        let parent: MapViewRepresentable
        init(parent: MapViewRepresentable) {
            
            self.parent = parent
            super.init()
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.region = mapView.region
        }
        /*
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            
            /*
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            parent.mapView.setRegion(region, animated: true)
             */
        } */
    }
}
