//
//  Locations.swift
//  MapLocations
//
//  Created by Ruslan on 12/20/18.
//  Copyright © 2018 Ruslan Naumenko. All rights reserved.
//

import Foundation
import MapKit

struct Locations {
    static var location : [(name: String, description: String, coordinates: CLLocation, span: MKCoordinateSpan, color: UIColor)] = [
        ("Unit Factory", "School you study at", CLLocation(latitude: 50.468967, longitude: 30.462218), MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001), UIColor.blue),
        ("НСК Олімпійський", "Heart of Ukrainian football", CLLocation(latitude: 50.433197, longitude: 30.521868), MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025), UIColor.green),
        ("Банка Бар", "Place you're getting drunk", CLLocation(latitude: 50.470420, longitude: 30.446254), MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001), UIColor.yellow)
    ]
}
