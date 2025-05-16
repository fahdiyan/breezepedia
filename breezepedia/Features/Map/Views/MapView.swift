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
    let tenants: [TenantModel2]
    
    @ObservedObject var viewModel: MapViewModel
    
    func makeUIView(context: Context) -> MKMapView {
        // Membuat map view dengan koordinat The Breeze
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(region, animated: false)
        
        // Menghilangkan semua pin point bawaan Apple Maps
        let config = MKStandardMapConfiguration()
        config.pointOfInterestFilter = .excludingAll
        mapView.preferredConfiguration = config
        
        // Map Overlay dengan desain map png
        let overlay = MapOverlay(topLeft: MapRegion.topLeft, bottomRight: MapRegion.bottomRight)
        mapView.addOverlay(overlay)
        
        // Membatasi scroll hanya area The Breeze
        let bufferMultiplier = 1.5
        let bufferedBoundary = MKCoordinateRegion(
            center: MapRegion.breezeMapRegion.center,
            span: MKCoordinateSpan(
                latitudeDelta: MapRegion.breezeMapRegion.span.latitudeDelta * bufferMultiplier,
                longitudeDelta: MapRegion.breezeMapRegion.span.longitudeDelta * bufferMultiplier
            )
        )
        mapView.setCameraBoundary(
            MKMapView.CameraBoundary(coordinateRegion: bufferedBoundary),
            animated: false
        )
        
        // Membatasi zoom hanya area The Breeze
        let zoomRange = MKMapView.CameraZoomRange(
            minCenterCoordinateDistance: 100, // Batas zoom minimum
            maxCenterCoordinateDistance: 1000 // Batas zoom maksimum
        )
        mapView.setCameraZoomRange(zoomRange, animated: false)
        
        // Menambahkan semua annotation tenants
        for tenant in tenants {
            let annotation = TenantAnnotation2(tenant: tenant)
            mapView.addAnnotation(annotation)
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}
    
    func makeCoordinator() -> MapCoordinator {
        MapCoordinator(overlayImage: overlayImage, viewModel: viewModel)
    }
}

#Preview {
    let viewModel = MapViewModel()
    MapView(
        region: MapRegion.breezeMapRegion,
        overlayImage: UIImage(named: "breezeMap2.png")!,
        tenants: dummyTenants2,
        viewModel: viewModel
    )
    .ignoresSafeArea()
}
