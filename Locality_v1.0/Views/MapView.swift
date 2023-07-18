//
//  MapView.swift
//  Locality_v1.0
//
//  Created by Varun Nair on 7/17/23.
//

import SwiftUI

struct MapView: View {
    
    @StateObject var mapViewModel = MapViewModel()
    @State private var isShowingSearchView = false
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            if !isShowingSearchView {
                MapViewRepresentable(mapView: $mapViewModel.mapView, region: $mapViewModel.region, locationManager: mapViewModel.locationManager)
                    .ignoresSafeArea()
                
                LocationSearchButton(isShowingSearchView: $isShowingSearchView)
                    .padding(.top, 10)
            } else {
                LocationSearchView(isShowingSearchView: $isShowingSearchView)
            }
        }
    }
}

#Preview {
    MapView()
}
