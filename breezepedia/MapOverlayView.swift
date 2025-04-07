//
//  MapOverlayView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 28/03/25.
//

import SwiftUI
import MapKit

struct MapViewWithOverlay: UIViewRepresentable {
    let coordinate = CLLocationCoordinate2D(latitude: -6.301723, longitude: 106.654462)
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let config = MKStandardMapConfiguration()
        config.pointOfInterestFilter = .excludingAll // Hilangkan semua titik lokasi
        config.showsTraffic = false // Matikan lalu lintas jika tidak diperlukan
        mapView.preferredConfiguration = config
        
        // Set region awal
//        let center = CLLocationCoordinate2D(latitude: -6.301723, longitude: 106.654462)
//        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002) // Atur seberapa besar area
        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
        mapView.setRegion(region, animated: false)
        
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

        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: boundaryRegion), animated: false)

        
        // Batasi zoom agar tidak bisa melihat seluruh dunia
        let zoomRange = MKMapView.CameraZoomRange(minCenterCoordinateDistance: 100, maxCenterCoordinateDistance: 900)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        
        // Tambahkan overlay gambar
        if let overlay = createImageOverlay() {
            mapView.addOverlay(overlay)
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    /// Fungsi untuk membuat overlay dari gambar
    func createImageOverlay() -> MKOverlay? {
        guard let image = UIImage(named: "mapTheBreeze.png") else { return nil }
        
        let topLeft = CLLocationCoordinate2D(latitude: -6.299637, longitude: 106.652895) // Sesuaikan dengan skala
        let bottomRight = CLLocationCoordinate2D(latitude: -6.303433, longitude: 106.656070)
        
        return MapImageOverlay(image: image, topLeft: topLeft, bottomRight: bottomRight)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewWithOverlay
        
        init(_ parent: MapViewWithOverlay) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let imageOverlay = overlay as? MapImageOverlay {
                return imageOverlay.renderer()
            }
            return MKOverlayRenderer()
        }
    }
}

/// **Custom overlay untuk menempatkan gambar di peta dengan skala & rotasi**
class MapImageOverlay: NSObject, MKOverlay {
    var coordinate: CLLocationCoordinate2D
    var boundingMapRect: MKMapRect
    var image: UIImage
    var angle: CGFloat // Rotasi dalam derajat
    
    init(image: UIImage, topLeft: CLLocationCoordinate2D, bottomRight: CLLocationCoordinate2D, angle: CGFloat = 0) {
        self.image = image
        self.angle = angle
        
        let topLeftMapPoint = MKMapPoint(topLeft)
        let bottomRightMapPoint = MKMapPoint(bottomRight)
        
        let origin = MKMapPoint(x: topLeftMapPoint.x, y: bottomRightMapPoint.y)
        let size = MKMapSize(
            width: bottomRightMapPoint.x - topLeftMapPoint.x,
            height: topLeftMapPoint.y - bottomRightMapPoint.y
        )
        
        self.boundingMapRect = MKMapRect(origin: origin, size: size)
        self.coordinate = CLLocationCoordinate2D(
            latitude: (topLeft.latitude + bottomRight.latitude) / 2,
            longitude: (topLeft.longitude + bottomRight.longitude) / 2
        )
    }
    
    func renderer() -> MKOverlayRenderer {
        return MapImageOverlayRenderer(overlay: self, image: image, angle: angle)
    }
}

/// **Renderer untuk menggambar gambar dengan skala & rotasi**
class MapImageOverlayRenderer: MKOverlayRenderer {
    var image: UIImage
    var angle: CGFloat
    
    init(overlay: MKOverlay, image: UIImage, angle: CGFloat) {
        self.image = image
        self.angle = angle
        super.init(overlay: overlay)
    }
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        guard let imageReference = image.cgImage else { return }
        
        let rect = rect(for: overlay.boundingMapRect)
        
        context.saveGState()
        
        // Pindahkan pusat ke titik tengah gambar
        context.translateBy(x: rect.midX, y: rect.midY)
        
        // *** Perbaiki mirroring dengan flipping di sumbu X ***
        context.scaleBy(x: 1.6, y: -1.6)
        
        // Rotasi gambar
        context.rotate(by: angle * (.pi / 180))
        
        // Kembalikan titik referensi ke kiri atas gambar
        context.translateBy(x: -rect.midX, y: -rect.midY)
        
        // Gambar image setelah transformasi
        context.draw(imageReference, in: rect)
        
        context.restoreGState()
    }
}

#Preview {
    MapViewWithOverlay()
}

