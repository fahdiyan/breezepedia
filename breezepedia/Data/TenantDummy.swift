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
        name: "J.Co Coffee",
        image: "jco_logo1",
        coverImage: "jco_breeze",
        category: ["Dessert","Coffee","Snacks"],
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
        image: "bebekbengil_logo",
        coverImage: "bebekbengil_breeze",
        category: ["Local Dish, Protein" ],
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
        image: "burgreens_logo1",
        coverImage: "bebekbengil_breeze",
        category: ["Western Dish","Protein"],
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
    "Boost": TenantModel(
        coordinate: CLLocationCoordinate2D(latitude: -6.301604216577298, longitude: 106.65389819148908),
        name: "Boost Juice",
        image: "boost_logo3",
        coverImage: "boost_breeze",
        category: ["Beverages","Dessert"],
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
    ),
    "Chaterise": TenantModel(
        coordinate: CLLocationCoordinate2D(latitude: -6.301604216577298, longitude: 106.65389819148908),
        name: "Chaterise",
        image: "chaterise_logo",
        coverImage: "boost_breeze",
        category: ["Dessert","Snacks"],
        openTime: "Open 10.00 - 20.00",
        cheapest: 20000,
        wifi: true,
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
        ),
    "SateSenayan": TenantModel(
        coordinate: CLLocationCoordinate2D(latitude: -6.301604216577298, longitude: 106.65389819148908),
        name: "Sate Senayan",
        image: "satesenayan_logo6",
        coverImage: "boost_breeze",
        category: ["Local Dish","Protein"],
        openTime: "Open 10.00 - 21.00",
        cheapest: 20000,
        wifi: true,
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
        ),
    "D'Cost Seafood": TenantModel(
        coordinate: CLLocationCoordinate2D(latitude: -6.297360302457948, longitude: 106.65428588120463),
        name: "D'cost Seafood",
        image: "dcost_logo",
        coverImage: "boost_breeze",
        category: ["Local Dish","Seafood"],
        openTime: "Open 10.00 - 20.00",
        cheapest: 20000,
        wifi: true,
        peakHour: "17.00 - 21.00",
        capacity: 50,
        halal: true,
        pet: false,
        menus: dummyMenus["Boost"] ?? [],
        isCheap: true,
        hasSmokingArea: true,
        hasOutdoor: false,
        isQuiet: true,
        isSpacious: true
        ),
    
    
    "Kenangan Coffee": TenantModel(
        coordinate: CLLocationCoordinate2D(latitude: -6.297360302457948, longitude: 106.65428588120463),
        name: "Kenangan Coffee",
        image: "kenangan_logo",
        coverImage: "kenangan_breeze",
        category: ["Coffee","Dessert","Beverages"],
        openTime: "Open 10.00 - 21.00",
        cheapest: 30000,
        wifi: true,
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
        ),
    
    
    
    
    
]

let dummyTenants: [TenantModel] = Array(dummyTenantsDict.values)
