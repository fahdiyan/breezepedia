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
    
    var body: some View {
        ZStack {
            MapViewWrapper(
                selectedAnnotation: $selectedAnnotation,
                annotationPosition: $annotationPosition,
                mapViewRef: $mapViewRef
            )
            .edgesIgnoringSafeArea(.all)
            
            // Tooltip muncul jika annotation dipilih
            //            if let selectedAnnotation, let mapView = mapViewRef {
            //                GeometryReader { geometry in
            //                    let point = mapView.convert(selectedAnnotation.coordinate, toPointTo: mapView)
            //                    VStack {
            //                        CustomTooltip(annotation: selectedAnnotation)
            //                            .position(annotationPosition)
            //                    }
            //                    .position(x: point.x + 80, y: point.y)
            //                }
            //            }
            
            // Tooltip
            if let selectedAnnotation = selectedAnnotation,
               let mapView = mapViewRef {
                GeometryReader { geometry in
                    let point = mapView.convert(selectedAnnotation.coordinate, toPointTo: mapView)
                    
                    VStack {
                        CustomTooltip(annotation: selectedAnnotation, tenant: ["yes"])
                    }
                    .position(x: point.x + 80, y: point.y - 40) // adjust offset if needed
                    .animation(.easeInOut, value: point)
                }
            }
        }
    }
}

struct MapViewWrapper: UIViewRepresentable {
    @Binding var selectedAnnotation: MKPointAnnotation?
    @Binding var annotationPosition: CGPoint
    @Binding var mapViewRef: MKMapView?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
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
        
        // Tambah marker
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Lokasi Utama"
        mapView.addAnnotation(annotation)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Diperbarui saat binding berubah (tidak digunakan sekarang)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewWrapper
        
        init(parent: MapViewWrapper) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            guard let annotation = view.annotation as? MKPointAnnotation else { return }
            
            // Simpan state selected
            parent.selectedAnnotation = annotation
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
            }
        }
    }
}

#Preview {
    CustomMapView()
}

