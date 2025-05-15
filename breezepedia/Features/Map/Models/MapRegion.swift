//
//  MapRegion.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 15/05/25.
//

import MapKit
import CoreLocation

enum MapRegion {
    static let breezeCenterRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -6.301658910318686, longitude: 106.65399869121431),
        span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
    )
}
