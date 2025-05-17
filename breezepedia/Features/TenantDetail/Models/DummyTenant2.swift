//
//  DummyTenant2.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 16/05/25.
//

let dummyTenants2: [TenantModel2] = Array(dummyTenantsDict2.values)

let dummyTenantsDict2: [String: TenantModel2] = [
    "J.Co": TenantModel2(
        name: "J.Co",
        image: "jco",
        coverImage: "jco_breeze",
        category: "Coffee",
        openTime: "Open 08.00 - 20.00",
        peakHour: "13.00 - 16.00",
        halal: true,
        wifi: true,
        pet: false,
        hasOutdoor: false,
        canSmoking: false,
        capacity: 16,
        avaragePrice: 10000,
        latitude: -6.301864789006899,
        longitude: 106.65476774255488
    ),
    "Bebek Bengil": TenantModel2(
        name: "Bebek Bengil",
        image: "bebekbengil",
        coverImage: "bebekbengil_breeze",
        category: "Seafood",
        openTime: "Open 08.00 - 22.00",
        peakHour: "17.00 - 21.00",
        halal: true,
        wifi: true,
        pet: false,
        hasOutdoor: false,
        canSmoking: false,
        capacity: 50,
        avaragePrice: 20000,
        latitude: -6.300613924151124,
        longitude: 106.6529659690328
    ),
    "Burgreens": TenantModel2(
        name: "Burgreens",
        image: "burgreens",
        coverImage: "bebekbengil_breeze",
        category: "Healthy Food",
        openTime: "Open 08.00 - 22.00",
        peakHour: "17.00 - 21.00",
        halal: true,
        wifi: true,
        pet: false,
        hasOutdoor: false,
        canSmoking: false,
        capacity: 50,
        avaragePrice: 20000,
        latitude: -6.301834313032891,
        longitude: 106.65358780840859
    ),
    "Boost": TenantModel2(
        name: "Boost Juice",
        image: "Boost",
        coverImage: "boost_breeze",
        category: "Beverage",
        openTime: "Open 08.00 - 17.00",
        peakHour: "17.00 - 21.00",
        halal: true,
        wifi: false,
        pet: false,
        hasOutdoor: false,
        canSmoking: false,
        capacity: 50,
        avaragePrice: 20000,
        latitude: -6.301604216577298,
        longitude: 106.65389819148908
    )
]
