//
//  MenuModel.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 27/03/25.
//

import SwiftUI

class MenuModel: Identifiable {
    let id: UUID = UUID()
    let name: String
    let image: String
    let description: String
    let price: Int
    
    init(
        name: String,
        image: String,
        description: String,
        price: Int
    ) {
        self.name = name
        self.image = image
        self.description = description
        self.price = price
    }
    
    static func generateMenuModel(forTenant tenantName: String) -> [MenuModel] {
        // Cari key yang cocok tanpa peduli kapitalisasi
        if let key = dummyMenus.keys.first(where: { $0.lowercased() == tenantName.lowercased() }) {
            return dummyMenus[key] ?? []
        } else {
            return []
        }
    }
}
