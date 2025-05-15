//
//  MapView.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 15/05/25.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let region: MKCoordinateRegion
    let overlayImage: UIImage

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(region, animated: false)
        
        let config = MKStandardMapConfiguration()
        config.pointOfInterestFilter = .excludingAll
        mapView.preferredConfiguration = config
        
        // Tambahkan overlay dengan koordinat manual
        let topLeft = CLLocationCoordinate2D(latitude: -6.2992869, longitude: 106.6517764)
        let bottomRight = CLLocationCoordinate2D(latitude: -6.3039533, longitude: 106.6562049)
        let overlay = MapOverlay(topLeft: topLeft, bottomRight: bottomRight)
        mapView.addOverlay(overlay)
        
        let southWest = CLLocationCoordinate2D(latitude: -6.3039533, longitude: 106.6517764)
        let northEast = CLLocationCoordinate2D(latitude: -6.2992869, longitude: 106.6562049)
        let boundary = MKMapView.CameraBoundary(coordinateRegion: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: (-6.2992869 + -6.3039533)/2,
                                           longitude: (106.6562049 + 106.6517764)/2),
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        )
        mapView.setCameraBoundary(boundary, animated: false)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(overlayImage: overlayImage)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        let overlayImage: UIImage

        init(overlayImage: UIImage) {
            self.overlayImage = overlayImage
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            return MapOverlayRenderer(overlay: overlay, overlayImage: overlayImage)
        }
    }
}
