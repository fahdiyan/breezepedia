//
//  MapRegion.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 15/05/25.
//

import MapKit
import CoreLocation

enum MapRegion {
    static let breezeMapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -6.301866949077773, longitude: 106.65401583889823),
        span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
    )
    
    static let bottomRight = CLLocationCoordinate2D(latitude: -6.3039533, longitude: 106.6517764)
    static let topLeft = CLLocationCoordinate2D(latitude: -6.2992869, longitude: 106.6562049)
}

// Memperbesar luas map
extension MKCoordinateRegion {
    func expandedBy(percentage: Double) -> MKCoordinateRegion {
        let expandedSpan = MKCoordinateSpan(
            latitudeDelta: span.latitudeDelta * (1 + percentage),
            longitudeDelta: span.longitudeDelta * (1 + percentage)
        )
        return MKCoordinateRegion(center: center, span: expandedSpan)
    }
}
