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
    
    static func generateMenuModel() -> [MenuModel] {
        return [
            MenuModel(
                name: "Jcochino",
                image: "jcochino",
                description: "Double shot espresso + milk",
                price: 27000
            ),
            MenuModel(
                name: "Matcha Frappe",
                image: "greenteafrappe",
                description: "Premium matcha powder + milk, garnished with whipped cream",
                price: 35000
            ),
            MenuModel(
                name: "Strawberry Yogurt Frappe",
                image: "strawberryfrappe",
                description: "Lorem ipsum dolor sit amet",
                price: 35000
            ),
            MenuModel(
                name: "Jcoccino Frappe",
                image: "jcoccinofrappe",
                description: "Lorem ipsum dolor sit amet",
                price: 35000
            ),
            MenuModel(
                name: "Iced Lemon Tea",
                image: "lemontea",
                description: "Lorem ipsum dolor sit amet",
                price: 21000
            ),
            MenuModel(
                name: "Alcapoon",
                image: "alcapoon",
                description: "Soft donut dough with slices of almond",
                price: 10000
            ),
            MenuModel(
                name: "Rainbow Choco",
                image: "rainbowchoco",
                description: "Soft donut dough with rainbow sprinkles on top",
                price: 10000
            ),
            MenuModel(
                name: "Choco Caviar",
                image: "caviarchoco",
                description: "Soft donut dough with small crunchy choco balls",
                price: 10000
            )
        ]
    }
}
