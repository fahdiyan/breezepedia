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
    @State var selectedTenant: TenantModel?
    @State private var route: MKRoute?
    
    // titik pintu masuk
    let entranceCoordinate = CLLocationCoordinate2D(latitude: -6.301453293388013, longitude: 106.653222511091)
    
    func calculateRoute(to destination: CLLocationCoordinate2D) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: entranceCoordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let route = response?.routes.first {
                self.route = route
            } else {
                print("Error getting directions: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
    
    var body: some View {
        ZStack {
            MapViewWrapper(
                selectedAnnotation: $selectedAnnotation,
                annotationPosition: $annotationPosition,
                mapViewRef: $mapViewRef,
                selectedTenantKey: $selectedTenantKey,
                selectedTenant: $selectedTenant,
                route: $route,
                tenants: dummyTenantsDict
            )
            .edgesIgnoringSafeArea(.all)
            
            // Tooltip
            if let tenantKey = selectedTenantKey,
               let tenant = dummyTenantsDict[tenantKey],
               let mapView = mapViewRef {
                GeometryReader { geometry in
                    let point = mapView.convert(tenant.coordinate, toPointTo: mapView)
                    
                    VStack {
                        CustomTooltip(tenant: tenant) {
                            calculateRoute(to: tenant.coordinate)
                            selectedTenantKey = nil
                            selectedAnnotation = nil
                            selectedTenant = nil
                        }
                    }
                    .position(x: point.x + 80, y: point.y - 40) // adjust offset if needed
                    .animation(.easeInOut, value: tenantKey)
                    .onAppear {
                        // Clear the route when a new tooltip appears
                        route = nil
                    }
                }
            }
        }
        .onChange(of: selectedTenantKey) { newKey in
            if newKey != nil {
                route = nil // Hapus route lama
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
    @Binding var route: MKRoute?
    
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
        
        // Remove existing route overlays
        uiView.removeOverlays(uiView.overlays)
        
        // Cek apakah ada route baru
        if let newRoute = route {
            if context.coordinator.lastRoute?.polyline !== newRoute.polyline {
                uiView.addOverlay(newRoute.polyline)
                uiView.setVisibleMapRect(
                    newRoute.polyline.boundingMapRect,
                    edgePadding: UIEdgeInsets(top: 80, left: 40, bottom: 80, right: 40),
                    animated: true
                )
                context.coordinator.lastRoute = newRoute
            }
        } else {
            context.coordinator.lastRoute = nil
            // Jangan zoom apapun
        }
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, UIGestureRecognizerDelegate {
        var parent: MapViewWrapper
        weak var mapView: MKMapView?
        var lastRoute: MKRoute?
        
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
        
        // proses trigger ketika tap annotation
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            guard let tenantAnnotation = view.annotation as? TenantAnnotation else { return }
            
            parent.selectedTenantKey = nil
            parent.selectedTenant = nil
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self.parent.selectedTenantKey = tenantAnnotation.key
                self.parent.selectedTenant = tenantAnnotation.tenant
                self.parent.route = nil
            }
            
            
            let point = mapView.convert(tenantAnnotation.coordinate, toPointTo: mapView)
            parent.annotationPosition = point
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
        
        // proses override icon annotation
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let tenantAnnotation = annotation as? TenantAnnotation else {
                return nil
            }
            
            let identifier = "CustomMarker"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = false
                annotationView?.image = UIImage(named: "location.fill") // ganti dengan custom icon kalau mau
                annotationView?.frame.size = CGSize(width: 40, height: 40)
                annotationView?.centerOffset = CGPoint(x: 0, y: -20)
                
                // Label tenant
                let label = UILabel()
                label.attributedText = NSAttributedString(string: tenantAnnotation.tenant.name, attributes: [
                    .strokeColor: UIColor.white,
                    .foregroundColor: UIColor(
                        red: 0x70 / 255,
                        green: 0x42 / 255,
                        blue: 0x9A / 255,
                        alpha: 1
                    ), // warna isi teks
                    .strokeWidth: -1.0, // negatif = isi teks tetap tampil
                    .font: UIFont.boldSystemFont(ofSize: 12)
                ])
                label.layer.cornerRadius = 4
                label.clipsToBounds = true
                label.textAlignment = .center
                label.sizeToFit()
                label.frame = CGRect(x: -label.frame.width - 10, y: (annotationView?.frame.height ?? 40) / 2 - 10, width: label.frame.width + 10, height: 20)
                
                // Tambahkan ke annotationView
                annotationView?.addSubview(label)
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
        
        // trigger ketika tap di luar annotation
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            DispatchQueue.main.async {
                self.parent.selectedAnnotation = nil
                self.parent.selectedTenantKey = nil
            }
        }
        
        // trigger proses render navigation
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .systemBlue
                renderer.lineWidth = 5
                return renderer
            }
            return MKOverlayRenderer()
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

