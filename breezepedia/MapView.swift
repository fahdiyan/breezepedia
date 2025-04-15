//
//  MapView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 27/03/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    let coordinate = CLLocationCoordinate2D(latitude: -6.301723, longitude: 106.654462) // The Breeze

    var body: some View {
        Map(initialPosition: .region(
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
            )
        )) {
            Marker("The Breeze", coordinate: coordinate)
            Marker("Chakra Venue & Lounge", coordinate: CLLocationCoordinate2D(latitude: -6.300558, longitude: 106.653688))
        }
        .mapStyle(.standard(pointsOfInterest: .excludingAll))
//        .frame(height: 300)
//        .overlay(
//            Text("Offline Map - Jakarta")
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding()
//                .background(Color.black.opacity(0.7))
//                .cornerRadius(10)
//                .padding(),
//            alignment: .top
//        )
    }
}

#Preview {
    MapView()
}
