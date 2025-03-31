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

    var body: some View {
        if isInlinetext {
            HStack {
                Image(type)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text(text)
                    .font(.custom("Poppins-Regular", size: 16))
                    .foregroundColor(Color(UIColor(
                        red: 0x70 / 255,
                        green: 0x42 / 255,
                        blue: 0x9A / 255,
                        alpha: 1
                    )))
            }
            .padding(5)
        } else {
            VStack {
                Image(type)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text(text)
                    .font(.custom("Poppins-Regular", size: 16))
                    .foregroundColor(Color(UIColor(
                        red: 0x70 / 255,
                        green: 0x42 / 255,
                        blue: 0x9A / 255,
                        alpha: 1
                    )))
            }
            .padding(5)
        }
    }
}

#Preview {
    Icon(type: "wifi_circle", isInlinetext: true)
}
