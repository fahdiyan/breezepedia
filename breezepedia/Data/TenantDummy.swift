//
//  TenantDummy.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 07/04/25.
//

let dummyTenantsDict: [String: TenantModel] = [
    "J.Co" : TenantModel(
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
        name: "Boost",
        image: "logo_jco",
        category: "Western",
        openTime: "08:00 - 22:00",
        cheapest: 20000,
        wifi: true,
        peakHour: "17:00 - 21:00",
        capacity: 50,
        halal: true,
        pet: false,
        menus: dummyMenus["Boost"] ?? []
    )
]

let dummyTenants: [TenantModel] = Array(dummyTenantsDict.values)
