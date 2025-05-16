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
    @Published var selectedTenant: TenantModel2? = nil
    
    let tenants: [TenantModel2] = dummyTenants2

    func iconName(for category: String) -> String {
        switch category {
        case "Coffee & Dessert": return "room.fill"
        case "Local Dish": return "navigation"
        case "Western Dish": return "silent.fill"
        case "Beverages": return "pet.fill"
        default: return "pricetag.fill"
        }
    }
}
