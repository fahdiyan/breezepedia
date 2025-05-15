//
//  MapViewModel.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 15/05/25.
//

import MapKit
import SwiftUI

class MapViewModel: ObservableObject {
    @Published var region = MapRegion.breezeCenterRegion
}

#Preview {
    MapView(
        region: MapRegion.breezeCenterRegion,
        overlayImage: UIImage(named: "breezeMap2.png")!
    )
    .ignoresSafeArea()
}
