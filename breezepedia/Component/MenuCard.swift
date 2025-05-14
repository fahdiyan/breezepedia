//
//  MenuCard.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 27/03/25.
//

import SwiftUI

struct MenuCard: View {
    var menu: MenuModel
    
    var body: some View {
        HStack(alignment: .center) {
            Image(menu.image)
                .resizable()
                .scaledToFill()
                .frame(width: 95, height: 95)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(8)
            
            VStack(alignment: .leading) {
                Text(menu.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding(.bottom, 4)
               
                Text(menu.description)
                   .font(.system(size: 12, weight: .regular))
                   .foregroundColor(.gray)
            
                
                Spacer()
               
                Text("Rp. \(menu.price),-")
                    .font(.system(size: 16, weight: .regular))
                   .foregroundColor(Color(UIColor(
                    red: 0x70 / 255,
                    green: 0x42 / 255,
                    blue: 0x9A / 255,
                    alpha: 1
                )))
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 2)
        }
        .frame(maxWidth: .infinity, maxHeight: 120, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.07), radius: 1, y: 3)
        
     
    }
}

#Preview {
    MenuCard(
        menu: MenuModel(
            name: "Jcocchino",
            image: "jcochino",
            description: "Double shot espresso + milk, garnished with foam aaaaaaaaaaaaaaaa",

            price: 27000
        )
    )
}
