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
                .frame(width: 86, height: 86)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(8)
            
            VStack(alignment: .leading) {
                Text(menu.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.purple)
                    .padding(.bottom, 4)
               
                Text(menu.description)
                   .font(.system(size: 10, weight: .regular))
                   .foregroundColor(.gray)
            
                
                Spacer()
               
                Text("Rp. \(menu.price),-")
                   .font(.system(size: 16, weight: .regular))
                   .foregroundColor(.purple)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 6)
        }
        .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 3)
     
    }
}

#Preview {
    MenuCard(
        menu: MenuModel(
            name: "Jcochino",
            image: "jcochino",
            description: "Double shot espresso + milk, garnished with foam aaaaaaaaaaaaaaaa",

            price: 27000
        )
    )
}
