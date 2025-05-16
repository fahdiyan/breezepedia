//
//  MenuModel2.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 16/05/25.
//

import Foundation
import SwiftData

@Model
class MenuModel2 {
    @Attribute(.unique) var id: UUID
    var name: String
    var image: String
    var menuDescription: String
    var price: Int

    @Relationship var tenant: TenantModel2?

    init(id: UUID = UUID(), name: String, image: String, description: String, price: Int, tenant: TenantModel2? = nil) {
        self.id = id
        self.name = name
        self.image = image
        self.menuDescription = description
        self.price = price
        self.tenant = tenant
    }
}
