//
//  CustomMapView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 07/04/25.
//

import SwiftUI
import MapKit

struct CustomMapView: View {
    @State private var selectedAnnotation: TenantAnnotation?
    @State private var annotationPosition: CGPoint = .zero
    @State private var mapViewRef: MKMapView?
    @State private var selectedTenantKey: String?
    @State var selectedTenant: TenantModel = dummyTenants[0]
    @State private var route: MKRoute?
    @State private var showEntranceAnnotation = false
    @State private var entranceCoordinate = CLLocationCoordinate2D(latitude: -6.301453293388013, longitude: 106.653222511091)
    @State private var routingDestinationKey: String? = nil
    @State private var showNavigation: Bool = false
    
    var tenants: [String: TenantModel]
    
    func calculateRoute(to destination: CLLocationCoordinate2D, key: String) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: entranceCoordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = .walking
//        self.showNavigation = true
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let route = response?.routes.first {
                self.route = route
                self.routingDestinationKey = key // simpan tujuan
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
                showEntranceAnnotation: $showEntranceAnnotation,
                routingDestinationKey: $routingDestinationKey,
                showNavigation: $showNavigation,
                tenants: tenants
            )
            .edgesIgnoringSafeArea(.all)
            
            // Show Navigation Bar
            if showNavigation {
//                RouteCardView(showNavigation: $showNavigation, tenant: selectedTenant, route: route,)
                RouteCardView(showNavigation: $showNavigation, tenant: selectedTenant, selectedAnnotation: $selectedAnnotation, mapViewRef: $mapViewRef, selectedTenantKey: $selectedTenantKey, route: $route, showEntranceAnnotation: $showEntranceAnnotation, routingDestinationKey: $routingDestinationKey)
            }
            
            // Tooltip
            if let tenantKey = selectedTenantKey,
               let tenant = tenants[tenantKey] {

                VStack {
                    CustomTooltip(tenant: tenant, showNavigation: $showNavigation) {
                        calculateRoute(to: tenant.coordinate, key: tenant.name)
                        selectedTenantKey = nil
                        selectedAnnotation = nil
//                        selectedTenant = nil
                        showEntranceAnnotation = true
                    }
                }
                .position(x: annotationPosition.x, y: annotationPosition.y - 150)
                .animation(.easeInOut, value: annotationPosition)
                .onAppear {
                    route = nil
                    showEntranceAnnotation = false
                }
            }
        }
        .onChange(of: selectedTenantKey) { newKey in
            guard let key = newKey,
                  let tenant = tenants[key] else {
                route = nil
                routingDestinationKey = nil // ✅ reset saat tenant deselect
                return
            }
            
            _ = tenant.coordinate
        }
    }
}

struct MapViewWrapper: UIViewRepresentable {
    @Binding var selectedAnnotation: TenantAnnotation?
    @Binding var annotationPosition: CGPoint
    @Binding var mapViewRef: MKMapView?
    @Binding var selectedTenantKey: String?
    @Binding var selectedTenant: TenantModel
    @Binding var route: MKRoute?
    @Binding var showEntranceAnnotation: Bool
    @Binding var routingDestinationKey: String?
    @Binding var showNavigation: Bool
    
    
    var tenants: [String: TenantModel]
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        context.coordinator.mapView = mapView
        
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
        // Membatasi area agar user tidak bisa keluar dari wilayah ini
        let northEast = CLLocationCoordinate2D(latitude: -6.300, longitude: 106.656)
        let southWest = CLLocationCoordinate2D(latitude: -6.303, longitude: 106.653)

        let centerLat = (northEast.latitude + southWest.latitude) / 2
        let centerLong = (northEast.longitude + southWest.longitude) / 2
        let spanLat = abs(northEast.latitude - southWest.latitude)
        let spanLong = abs(northEast.longitude - southWest.longitude)

        let boundaryRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: centerLat, longitude: centerLong),
            span: MKCoordinateSpan(latitudeDelta: spanLat, longitudeDelta: spanLong)
        )
        mapView.setRegion(region, animated: false)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: boundaryRegion), animated: false)
        
        let config = MKStandardMapConfiguration()
        config.pointOfInterestFilter = .excludingAll // Hilangkan semua titik lokasi
        config.showsTraffic = false // Matikan lalu lintas jika tidak diperlukan
        mapView.preferredConfiguration = config
        
        // Batasi zoom agar tidak bisa melihat seluruh dunia
        let zoomRange = MKMapView.CameraZoomRange(minCenterCoordinateDistance: 100, maxCenterCoordinateDistance: 1000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        // Setup markers
        for (key, tenant) in tenants {
            let annotation = TenantAnnotation(tenant: tenant, key: key)
            mapView.addAnnotation(annotation)
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Hapus semua tenant annotation sebelum update
        let currentTenantAnnotations = uiView.annotations.compactMap { $0 as? TenantAnnotation }
        for annotation in currentTenantAnnotations {
            uiView.removeAnnotation(annotation)
        }
        
        // Tambahkan kembali hasil tenant yang sesuai filter
        for (key, tenant) in tenants {
            let annotation = TenantAnnotation(tenant: tenant, key: key)
            uiView.addAnnotation(annotation)
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
                showNavigation = true
            }
        } else {
            context.coordinator.lastRoute = nil
//            showEntranceAnnotation = false
//            showNavigation = false
            // Jangan zoom apapun
        }
        
        if showEntranceAnnotation {
            if !uiView.annotations.contains(where: { $0 is EntranceAnnotation }) {
                uiView.addAnnotation(context.coordinator.entranceAnnotation)
            }
        } else {
            uiView.removeAnnotation(context.coordinator.entranceAnnotation)
        }
        
        if let destinationKey = routingDestinationKey {
            for annotation in uiView.annotations {
                if let tenantAnnotation = annotation as? TenantAnnotation {
                    if tenantAnnotation.key != destinationKey {
                        uiView.view(for: annotation)?.isHidden = true
                    } else {
                        uiView.view(for: annotation)?.isHidden = false
                    }
                } else if annotation is EntranceAnnotation {
                    uiView.view(for: annotation)?.isHidden = false
                }
            }
        } else {
            // Tampilkan semua annotation kembali jika tidak routing
            for annotation in uiView.annotations {
                uiView.view(for: annotation)?.isHidden = false
            }
        }
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, UIGestureRecognizerDelegate {
        var parent: MapViewWrapper
        weak var mapView: MKMapView?
        var lastRoute: MKRoute?
        // titik pintu masuk
        var entranceAnnotation = EntranceAnnotation(coordinate: CLLocationCoordinate2D(latitude: -6.301453293388013, longitude: 106.653222511091))
        
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
                parent.selectedAnnotation = nil
            }
        }
        
        // proses trigger ketika tap annotation
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            guard let tenantAnnotation = view.annotation as? TenantAnnotation else { return }
            
            self.parent.selectedTenantKey = nil
//            self.parent.selectedTenant = nil
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self.parent.selectedTenantKey = tenantAnnotation.key
                self.parent.selectedTenant = tenantAnnotation.tenant
                self.parent.route = nil
            }
            
            
            let point = mapView.convert(tenantAnnotation.coordinate, toPointTo: mapView)
            parent.annotationPosition = point
            parent.selectedAnnotation = tenantAnnotation
        }
        
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            updateAnnotationPosition(in: mapView)
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            updateAnnotationPosition(in: mapView)
        }
        
        private func updateAnnotationPosition(in mapView: MKMapView) {
            if let key = parent.selectedTenantKey,
               let annotation = mapView.annotations.first(where: {
                   ($0 as? TenantAnnotation)?.key == key
               }) {
                let point = mapView.convert(annotation.coordinate, toPointTo: mapView)
                DispatchQueue.main.async {
                    self.parent.annotationPosition = point
                }
            }
        }
        
        // proses override icon annotation
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is EntranceAnnotation {
                let identifier = "EntranceAnnotation"
                var view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                
                if view == nil {
                    view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                    view?.image = UIImage(named: "navigation") // ganti dengan asset kamu
                    view?.canShowCallout = true
                } else {
                    view?.annotation = annotation
                }
                
                return view
            }
            
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
            } else {
                annotationView?.annotation = annotation
                annotationView?.subviews.forEach { $0.removeFromSuperview() } // hapus label lama
            }
            
            annotationView?.image = UIImage(named: "location.fill")
            
            // label tenant
            let label = UILabel()
            label.attributedText = NSAttributedString(
                string: tenantAnnotation.tenant.name,
                attributes: [
                    .strokeColor: UIColor.white,
                    .foregroundColor: UIColor(
                        red: 0x70 / 255,
                        green: 0x42 / 255,
                        blue: 0x9A / 255,
                        alpha: 1
                    ),
                    .strokeWidth: -1.0,
                    .font: UIFont.boldSystemFont(ofSize: 14)
                ]
            )
            label.layer.cornerRadius = 4
            label.clipsToBounds = true
            label.textAlignment = .center
            label.sizeToFit()
            label.frame = CGRect(
                x: -label.frame.width - 10,
                y: (annotationView?.frame.height ?? 40) / 2 - 10,
                width: label.frame.width + 10,
                height: 20
            )
            
            annotationView?.addSubview(label)
            
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
    
    class EntranceAnnotation: NSObject, MKAnnotation {
        let coordinate: CLLocationCoordinate2D
        var title: String? = "Lobby Utama"
        
        init(coordinate: CLLocationCoordinate2D) {
            self.coordinate = coordinate
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

#Preview {
    CustomMapView(
        tenants: dummyTenantsDict
    )
}

