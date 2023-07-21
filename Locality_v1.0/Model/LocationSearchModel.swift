//
//  LocationSearchModel.swift
//  Locality_v1.0
//
//  Created by Varun Nair on 7/19/23.
//

import SwiftUI
import MapKit

class LocationSearchModel: NSObject, ObservableObject {
    
    /// Class Properties
    @Published var results = [MKLocalSearchCompletion()]
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            //print("Debug: Query fragment is \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
        
    }
}

extension LocationSearchModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
