//
//  MapCoordinator.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 16/05/25.
//

import MapKit

class MapCoordinator: NSObject, MKMapViewDelegate {
    let overlayImage: UIImage
    var viewModel: MapViewModel
    
    init(overlayImage: UIImage, viewModel: MapViewModel) {
        self.overlayImage = overlayImage
        self.viewModel = viewModel
    }
    
    // Menampilkan map overlay (desain)
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        return MapOverlayRenderer(overlay: overlay, overlayImage: overlayImage)
    }
    
    // Selected Tenant
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let title = view.annotation?.title ?? nil,
              let selected = dummyTenantsDict2[title] else { return }
        viewModel.selectedTenant = selected
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        guard let tenantAnnotation = annotation as? TenantAnnotation2 else {
            return nil
        }
        
        let identifier = "TenantMarker"
        var view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if view == nil {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view?.canShowCallout = true
            view?.markerTintColor = .orange
            view?.glyphImage = UIImage(named: viewModel.iconName(for: tenantAnnotation.tenant.category))
            view?.glyphTintColor = .white
            view?.selectedGlyphImage = UIImage(named: "room.fill")
        } else {
            view?.annotation = annotation
        }
        
        return view
    }
}
