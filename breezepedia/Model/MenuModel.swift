//
//  MenuModel.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 27/03/25.
//

import SwiftUI

class MenuModel: Identifiable, ObservableObject {
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
                name: "Vanilla Frappucino",
                image: "vanilla-frappucino",
                description: "Double shot espresso + milk",
                price: 35000
            ),
            MenuModel(
                name: "Lorem Ipsum",
                image: "lorem-ipsum",
                description: "Lorem ipsum dolor sit amet",
                price: 24000
            ),
            MenuModel(
                name: "Lorem Ipsum",
                image: "lorem-ipsum",
                description: "Lorem ipsum dolor sit amet",
                price: 24000
            ),
            MenuModel(
                name: "Lorem Ipsum",
                image: "lorem-ipsum",
                description: "Lorem ipsum dolor sit amet",
                price: 24000
            ),
            MenuModel(
                name: "Lorem Ipsum",
                image: "lorem-ipsum",
                description: "Lorem ipsum dolor sit amet",
                price: 24000
            ),
            MenuModel(
                name: "Lorem Ipsum",
                image: "lorem-ipsum",
                description: "Lorem ipsum dolor sit amet",
                price: 24000
            ),
            MenuModel(
                name: "Lorem Ipsum",
                image: "lorem-ipsum",
                description: "Lorem ipsum dolor sit amet",
                price: 24000
            ),
            MenuModel(
                name: "Lorem Ipsum",
                image: "lorem-ipsum",
                description: "Lorem ipsum dolor sit amet",
                price: 24000
            ),
            MenuModel(
                name: "Lorem Ipsum",
                image: "lorem-ipsum",
                description: "Lorem ipsum dolor sit amet",
                price: 24000
            )

        ]
    }
}
