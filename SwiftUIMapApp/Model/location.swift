//
//  location.swift
//  SwiftUIMapApp
//
//  Created by Zohidjon on 05/03/26.
//

import Foundation
import MapKit

struct Location: Identifiable , Equatable {
    

//    let id = UUID().uuidString   not filexeble
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    var id : String {
        // name = "Colosseum"
        // cityName = "Rome"
        // id = "ColosseumRome"
        name + cityName
    }
    // Equateable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}


