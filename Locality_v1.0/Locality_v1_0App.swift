//
//  Locality_v1_0App.swift
//  Locality_v1.0
//
//  Created by Varun Nair on 7/17/23.
//

import SwiftUI

@main
struct Locality_v1_0App: App {
    
    @StateObject var mapViewModel = MapViewModel()
    
    var body: some Scene {
        WindowGroup {
            MapView()
                .environmentObject(mapViewModel)
        }
    }
}
