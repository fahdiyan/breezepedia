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
        case "Coffee": return "coffee"
        case "Beverage": return "beverage"
        case "Dessert": return "dessert"
        case "Seafood": return "seafood"
        case "Pizza": return "pizza"
        case "Healthy Food": return "healthyFood"
        case "Fruit": return "fruit"
        case "Chicken": return "chicken"
        default: return "coffee"
        }
    }
}
