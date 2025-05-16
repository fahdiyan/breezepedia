//
//  MapOverlay.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 15/05/25.
//

import MapKit

class MapOverlay: NSObject, MKOverlay {
    let coordinate: CLLocationCoordinate2D
    let boundingMapRect: MKMapRect

    init(topLeft: CLLocationCoordinate2D, bottomRight: CLLocationCoordinate2D) {
        // Koordinat tengah untuk MKOverlay
        self.coordinate = CLLocationCoordinate2D(
            latitude: (topLeft.latitude + bottomRight.latitude) / 2,
            longitude: (topLeft.longitude + bottomRight.longitude) / 2
        )

        // Konversi ke MKMapPoint
        let point1 = MKMapPoint(topLeft)
        let point2 = MKMapPoint(bottomRight)

        // Hitung rect
        let origin = MKMapPoint(
            x: min(point1.x, point2.x),
            y: min(point1.y, point2.y)
        )

        let size = MKMapSize(
            width: abs(point1.x - point2.x),
            height: abs(point1.y - point2.y)
        )

        self.boundingMapRect = MKMapRect(origin: origin, size: size)
    }
}
