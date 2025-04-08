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
        image: "logo_jco",
        category: "Coffee",
        openTime: "08:00 - 20:00",
        cheapest: 10000,
        wifi: true,
        peakHour: "13:00 - 16:00",
        capacity: 16,
        halal: true,
        pet: false,
        menus: dummyMenus["J.Co"] ?? []
    ),
    "bebek bengil": TenantModel(
        coordinate: CLLocationCoordinate2D(latitude: -6.300613924151124, longitude: 106.6529659690328),
        name: "bebek bengil",
        image: "logo_jco",
        category: "Western",
        openTime: "08:00 - 22:00",
        cheapest: 20000,
        wifi: true,
        peakHour: "17:00 - 21:00",
        capacity: 50,
        halal: true,
        pet: false,
        menus: dummyMenus["bebek begil"] ?? []
    ),
    "Burgreens": TenantModel(
        coordinate: CLLocationCoordinate2D(latitude: -6.301817238256368, longitude: 106.65358448881841),
        name: "Burgreens",
        image: "logo_jco",
        category: "Western",
        openTime: "08:00 - 22:00",
        cheapest: 20000,
        wifi: true,
        peakHour: "17:00 - 21:00",
        capacity: 50,
        halal: true,
        pet: false,
        menus: dummyMenus["Burgreens"] ?? []
    ),
    "Boost": TenantModel(
        coordinate: CLLocationCoordinate2D(latitude: -6.301604216577298, longitude: 106.65389819148908),
        name: "Boost",
        image: "logo_jco",
        category: "Western",
        openTime: "08:00 - 17:00",
        cheapest: 20000,
        wifi: false,
        peakHour: "17:00 - 21:00",
        capacity: 50,
        halal: true,
        pet: false,
        menus: dummyMenus["Boost"] ?? []
    )
]

let dummyTenants: [TenantModel] = Array(dummyTenantsDict.values)
