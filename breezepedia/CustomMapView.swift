//
//  CustomMapView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 07/04/25.
//

import SwiftUI
import MapKit

struct CustomMapView: View {
    @State private var selectedAnnotation: MKPointAnnotation?
    @State private var annotationPosition: CGPoint = .zero
    @State private var mapViewRef: MKMapView?
    @State private var selectedTenantKey: String?
    @State private var selectedTenant: TenantModel?
    
    var body: some View {
        ZStack {
            MapViewWrapper(
                selectedAnnotation: $selectedAnnotation,
                annotationPosition: $annotationPosition,
                mapViewRef: $mapViewRef,
                selectedTenantKey: $selectedTenantKey,
                selectedTenant: $selectedTenant,
                tenants: dummyTenantsDict
            )
            .edgesIgnoringSafeArea(.all)
            
            // Tooltip
            if let selectedTenantKey = selectedTenantKey,
               let selectedTenant = dummyTenantsDict[selectedTenantKey],
               let mapView = mapViewRef {
                GeometryReader { geometry in
                    let point = mapView.convert(selectedTenant.coordinate, toPointTo: mapView)
                    
                    VStack {
                        CustomTooltip(tenant: selectedTenant)
                    }
                    .position(x: point.x + 80, y: point.y - 40) // adjust offset if needed
                    .animation(.easeInOut, value: selectedTenantKey)
                }
            }
        }
    }
}

struct MapViewWrapper: UIViewRepresentable {
    @Binding var selectedAnnotation: MKPointAnnotation?
    @Binding var annotationPosition: CGPoint
    @Binding var mapViewRef: MKMapView?
    @Binding var selectedTenantKey: String?
    @Binding var selectedTenant: TenantModel?
    
    var tenants: [String: TenantModel]
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // Untuk handle hide / show / switch tooltip
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleMapTap(_:)))
        tapGesture.delegate = context.coordinator
        mapView.addGestureRecognizer(tapGesture)
        
        // Simpan reference mapView ke parent
        DispatchQueue.main.async {
            self.mapViewRef = mapView
        }
        
        let coordinate = CLLocationCoordinate2D(latitude: -6.301723, longitude: 106.654462)
        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
        mapView.setRegion(region, animated: false)
        
        let config = MKStandardMapConfiguration()
        config.pointOfInterestFilter = .excludingAll // Hilangkan semua titik lokasi
        config.showsTraffic = false // Matikan lalu lintas jika tidak diperlukan
        mapView.preferredConfiguration = config
        
        // Setup markers
        for (key, tenant) in tenants {
            let annotation = TenantAnnotation(tenant: tenant, key: key)
            mapView.addAnnotation(annotation)
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update tooltip visibility based on selectedTenantKey
        for annotation in uiView.annotations {
            guard let annotationView = uiView.view(for: annotation),
                  let tenantAnnotation = annotation as? TenantAnnotation else { continue }
            
            if tenantAnnotation.key == selectedTenantKey {
                annotationView.detailCalloutAccessoryView?.isHidden = false
            } else {
                annotationView.detailCalloutAccessoryView?.isHidden = true
            }
        }
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, UIGestureRecognizerDelegate {
        var parent: MapViewWrapper
        weak var mapView: MKMapView?
        
        init(parent: MapViewWrapper) {
            self.parent = parent
        }
        
        @objc func handleMapTap(_ gestureRecognizer: UITapGestureRecognizer) {
            guard let mapView = self.mapView else { return }
            let location = gestureRecognizer.location(in: mapView)
            
            // Cek apakah titik tap cukup dekat dengan marker
            let tappedAnnotations = mapView.annotations.filter { annotation in
                let point = mapView.convert(annotation.coordinate, toPointTo: mapView)
                let dx = abs(point.x - location.x)
                let dy = abs(point.y - location.y)
                return dx < 30 && dy < 30 // toleransi area tap ke marker
            }
            
            if tappedAnnotations.isEmpty {
                parent.selectedTenantKey = nil
            }
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            guard let tenantAnnotation = view.annotation as? TenantAnnotation else { return }
            
            // Simpan state selected
            parent.selectedTenantKey = tenantAnnotation.key
            parent.selectedAnnotation = tenantAnnotation.annotation
        }
        
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            // Update position only if annotation is selected
            if let annotation = parent.selectedAnnotation {
                let point = mapView.convert(annotation.coordinate, toPointTo: mapView)
                DispatchQueue.main.async {
                    self.parent.annotationPosition = point
                }
            }
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            if let annotation = parent.selectedAnnotation {
                let point = mapView.convert(annotation.coordinate, toPointTo: mapView)
                DispatchQueue.main.async {
                    self.parent.annotationPosition = point
                }
            }
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "CustomMarker"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = false
                annotationView?.image = UIImage(named: "location.fill") // ganti dengan custom icon kalau mau
                annotationView?.frame.size = CGSize(width: 40, height: 40)
                annotationView?.centerOffset = CGPoint(x: 0, y: -20)
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            DispatchQueue.main.async {
                self.parent.selectedAnnotation = nil
                self.parent.selectedTenantKey = nil
            }
        }
    }
    
    class TenantAnnotation: NSObject, MKAnnotation {
        let annotation: MKPointAnnotation
        let coordinate: CLLocationCoordinate2D
        let tenant: TenantModel
        let key: String
        
        init(tenant: TenantModel, key: String) {
            self.annotation = MKPointAnnotation()
            self.coordinate = tenant.coordinate
            self.tenant = tenant
            self.key = tenant.name
            self.annotation.coordinate = tenant.coordinate
            self.annotation.title = tenant.name
            super.init()
        }
        
        var title: String? {
            tenant.name
        }
    }
}

#Preview {
    CustomMapView()
}

