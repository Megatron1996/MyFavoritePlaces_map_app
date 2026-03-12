//
//  LocationsViewModel.swift
//  SwiftUIMapApp
//
//  Created by Zohidjon on 05/03/26.
//

import Foundation
import Combine
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    // all loaded location
    @Published var locations: [Location]
    // current location on the map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    // current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    // show list of location
    
    @Published var showLocationsList: Bool = false
    
    // shoe location detail via sheet
    @Published var sheetLocation: Location? = nil
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
     func toggleLocationsList() {
        withAnimation(.easeInOut){
            showLocationsList.toggle()
        }
    }
    func showNextLocation(location: Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationsList = false
        }
    }
    func nextButtonTapped(){
        guard let currentIndex = locations.firstIndex(
            where: {$0 == mapLocation}) else {
            print("Could not find current location in locations array")
            return
        }
              let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
        
    }
}

