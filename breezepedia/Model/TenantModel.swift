//
//  TenantModel.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 07/04/25.
//

import SwiftUI
import MapKit

class TenantModel: Identifiable {
    let id: UUID = UUID()
    let name: String
    let image: String
    let category: String
    let openTime: String
    let coordinate: CLLocationCoordinate2D
    
    // Facility
    let cheapest: Int
    let wifi: Bool
    let peakHour: String
    let capacity: Int
    let halal: Bool
    let pet: Bool
    
    // Menu
    let menus: [MenuModel]
    
    init(
        coordinate: CLLocationCoordinate2D,
        name: String,
        image: String,
        category: String,
        openTime: String,
        cheapest: Int,
        wifi: Bool,
        peakHour: String,
        capacity: Int,
        halal: Bool,
        pet: Bool,
        menus: [MenuModel]
    ) {
        self.coordinate = coordinate
        self.name = name
        self.image = image
        self.category = category
        self.openTime = openTime
        self.cheapest = cheapest
        self.wifi = wifi
        self.peakHour = peakHour
        self.capacity = capacity
        self.halal = halal
        self.pet = pet
        self.menus = menus
    }
}
