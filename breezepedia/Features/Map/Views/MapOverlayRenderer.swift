//
//  MapOverlayRenderer.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 15/05/25.
//

import MapKit

class MapOverlayRenderer: MKOverlayRenderer {
    var overlayImage: UIImage

    init(overlay: MKOverlay, overlayImage: UIImage) {
        self.overlayImage = overlayImage
        super.init(overlay: overlay)
    }

    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        guard let imageRef = overlayImage.cgImage else { return }

        let rect = self.rect(for: overlay.boundingMapRect)
        context.translateBy(x: 0, y: rect.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.draw(imageRef, in: rect)
    }
}
