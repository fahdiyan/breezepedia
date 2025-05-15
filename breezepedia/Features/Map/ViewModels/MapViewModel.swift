//
//  MapViewModel.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 15/05/25.
//

import MapKit
import SwiftUI

class MapViewModel: ObservableObject {
    @Published var region = MapRegion.breezeMapRegion
}

#Preview {
    MapView(
        region: MapRegion.breezeMapRegion,
        overlayImage: UIImage(named: "breezeMap2.png")!
    )
    .ignoresSafeArea()
}
