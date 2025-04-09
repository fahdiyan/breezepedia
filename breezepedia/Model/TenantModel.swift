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
    let coverImage: String
    
    // Facility
    let cheapest: Int
    let wifi: Bool
    let peakHour: String
    let capacity: Int
    let halal: Bool
    let pet: Bool
    let isCheap: Bool
    let hasSmokingArea: Bool
    let hasOutdoor: Bool
    let isQuiet: Bool
    let isSpacious: Bool
    
    // Menu
    var menus: [MenuModel] {
        MenuModel.generateMenuModel(forTenant: name)
    }
    
    init(
        coordinate: CLLocationCoordinate2D,
        name: String,
        image: String,
        coverImage: String,
        category: String,
        openTime: String,
        cheapest: Int,
        wifi: Bool,
        peakHour: String,
        capacity: Int,
        halal: Bool,
        pet: Bool,
        menus: [MenuModel],
        isCheap: Bool,
        hasSmokingArea: Bool,
        hasOutdoor: Bool,
        isQuiet: Bool,
        isSpacious: Bool
    ) {
        self.coordinate = coordinate
        self.name = name
        self.image = image
        self.coverImage = coverImage
        self.category = category
        self.openTime = openTime
        self.cheapest = cheapest
        self.wifi = wifi
        self.peakHour = peakHour
        self.capacity = capacity
        self.halal = halal
        self.pet = pet
        self.isCheap = isCheap
        self.hasSmokingArea = hasSmokingArea
        self.hasOutdoor = hasOutdoor
        self.isQuiet = isQuiet
        self.isSpacious = isSpacious
    }
    
    func isHalalMenu() -> Image {
        return Image(systemName: self.halal ? "checkmark" : "xmark")
            .resizable()
            
    }
}
