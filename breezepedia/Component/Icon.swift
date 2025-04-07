//
//  Icon.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 27/03/25.
//

import SwiftUI

struct Icon: View {
    var type: String = "price_circle"
    var text: String = "Rp. 10,000"
    var isInlinetext: Bool = true
    var textSize: CGFloat = 16
    var color: Color? = Color(hue: 0, saturation: 0, brightness: 0.47)
    var size: CGFloat = 30

    var body: some View {
        if isInlinetext {
            HStack {
                Image(type)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                Text(text)
                    .font(.custom("Poppins-Regular", size: textSize))
                    .foregroundColor(color)
            }
            .padding(5)
        } else {
            VStack {
                Image(type)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                Text(text)
                    .font(.custom("Poppins-Regular", size: textSize))
                    .foregroundColor(color)
            }
            .padding(5)
        }
    }
}

#Preview {
    Icon(type: "wifi_circle", isInlinetext: true)
}
