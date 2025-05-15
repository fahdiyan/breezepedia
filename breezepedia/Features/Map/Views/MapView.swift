//
//  MapView.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 15/05/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var position = MapCameraPosition.region(MapRegion.breezeCenterRegion)
    
    var body: some View {
        Map(position: $position) {
            Marker("Tenant", systemImage: "storefront.fill", coordinate: CLLocationCoordinate2D(latitude:  -6.3019, longitude: 106.6539))
                .tint(.blue)
            
            Annotation("Pintu Masuk", coordinate: CLLocationCoordinate2D(latitude: -6.3015, longitude: 106.6535)) {
                VStack {
                    Image(systemName: "door.left.hand.open")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.green)
                    Text("Pintu")
                        .font(.caption2)
                        .padding(.top, 2)
                } // Nanti ini pisahkan saja
            }
        }
        .mapStyle(.standard(elevation: .flat, pointsOfInterest: .excludingAll))
        .ignoresSafeArea()
    }
}

#Preview {
    MapView()
}
