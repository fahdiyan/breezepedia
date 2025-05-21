//
//  TenantDummy.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 07/04/25.
//

import MapKit

let dummyTenantsDict: [String: TenantModel] = [
    "J.Co" : TenantModel(
        coordinate: CLLocationCoordinate2D(latitude: -6.301864789006899, longitude: 106.65476774255488),
        name: "J.Co",
        image: "jco",
        coverImage: "jco_breeze",
        category: "Coffee & Dessert",
        openTime: "Open 08.00 - 20.00",
        cheapest: 10000,
        wifi: true,
        peakHour: "13.00 - 16.00",
        capacity: 16,
        halal: true,
        pet: false,
        menus: dummyMenus["J.Co"] ?? [],
        isCheap: true,
        hasSmokingArea: false,
        hasOutdoor: false,
        isQuiet: true,
        isSpacious: true
    ),
    "Bebek Bengil": TenantModel(
        coordinate: CLLocationCoordinate2D(latitude: -6.300613924151124, longitude: 106.6529659690328),
        name: "Bebek Bengil",
        image: "bebekbengil",
        coverImage: "bebekbengil_breeze",
        category: "Local Dish",
        openTime: "Open 08.00 - 22.00",
        cheapest: 20000,
        wifi: true,
        peakHour: "17.00 - 21.00",
        capacity: 50,
        halal: true,
        pet: false,
        menus: dummyMenus["Bebek Bengil"] ?? [],
        isCheap: true,
        hasSmokingArea: false,
        hasOutdoor: false,
        isQuiet: true,
        isSpacious: true
    ),
    "Burgreens": TenantModel(
        coordinate: CLLocationCoordinate2D(latitude: -6.301834313032891, longitude:  106.65358780840859),
        name: "Burgreens",
        image: "burgreens",
        coverImage: "bebekbengil_breeze",
        category: "Western Dish",
        openTime: "Open 08.00 - 22.00",
        cheapest: 20000,
        wifi: true,
        peakHour: "17.00 - 21.00",
        capacity: 50,
        halal: true,
        pet: false,
        menus: dummyMenus["Burgreens"] ?? [],
        isCheap: true,
        hasSmokingArea: false,
        hasOutdoor: false,
        isQuiet: true,
        isSpacious: true
    ),
    "Boost Juice": TenantModel(
        coordinate: CLLocationCoordinate2D(latitude: -6.301604216577298, longitude: 106.65389819148908),
        name: "Boost Juice",
        image: "Boost",
        coverImage: "boost_breeze",
        category: "Beverages",
        openTime: "Open 08.00 - 17.00",
        cheapest: 20000,
        wifi: false,
        peakHour: "17.00 - 21.00",
        capacity: 50,
        halal: true,
        pet: false,
        menus: dummyMenus["Boost"] ?? [],
        isCheap: true,
        hasSmokingArea: false,
        hasOutdoor: false,
        isQuiet: true,
        isSpacious: true
    )
]

let dummyTenants: [TenantModel] = Array(dummyTenantsDict.values)
