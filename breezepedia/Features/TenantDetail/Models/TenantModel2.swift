//
//  TenantModel2.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 16/05/25.
//

import Foundation
import SwiftData
import CoreLocation

@Model
class TenantModel2 {
    @Attribute(.unique) var id: UUID
    var name: String
    var image: String
    var coverImage: String
    var category: String
    var openTime: String
    var peakHour: String
    
    var halal: Bool
    var wifi: Bool
    var pet: Bool
    var hasOutdoor: Bool
    var canSmoking: Bool

    var capacity: Int
    var avaragePrice: Int
    
    var latitude: Double
    var longitude: Double

    @Relationship(deleteRule: .cascade, inverse: \MenuModel2.tenant)
    var menus: [MenuModel2] = []

    init(
        id: UUID = UUID(),
        name: String,
        image: String,
        coverImage: String,
        category: String,
        openTime: String,
        peakHour: String,
        halal: Bool,
        wifi: Bool,
        pet: Bool,
        hasOutdoor: Bool,
        canSmoking: Bool,
        capacity: Int,
        avaragePrice: Int,
        latitude: Double,
        longitude: Double
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.coverImage = coverImage
        self.category = category
        self.openTime = openTime
        self.peakHour = peakHour
        self.halal = halal
        self.wifi = wifi
        self.pet = pet
        self.hasOutdoor = hasOutdoor
        self.canSmoking = canSmoking
        self.capacity = capacity
        self.avaragePrice = avaragePrice
        self.latitude = latitude
        self.longitude = longitude
    }

    var coordinate: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}
