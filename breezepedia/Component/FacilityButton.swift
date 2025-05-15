//
//  FacilityButton.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 05/04/25.
//

import SwiftUI

struct FacilityButton: View {
    let label: String
    let icon: String
    let selectedIcon: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Image(isSelected ? selectedIcon : icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                Text(label)
                    .font(.custom("Poppins-Regular", size: 16))
                    .lineLimit(2)
                    
            
            }
            .frame(width: 70, height: 70)
            .padding(6.5)
            .foregroundColor(isSelected
                             ? .white
                             : Color(UIColor(
                                red: 0x70 / 255,
                                green: 0x42 / 255,
                                blue: 0x9A / 255,
                                alpha: 1
                            ))
            )
            .background(isSelected
                        ? Color(UIColor(
                            red: 0x70 / 255,
                            green: 0x42 / 255,
                            blue: 0x9A / 255,
                            alpha: 1
                        ))
                        : Color.clear
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(UIColor(
                        red: 0x70 / 255,
                        green: 0x42 / 255,
                        blue: 0x9A / 255,
                        alpha: 1
                    )), lineWidth: 2)
            )
            .cornerRadius(10)
        }
        .animation(.easeInOut(duration: 0.1), value: isSelected)
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var isSelected = false

        var body: some View {
            FacilityButton(
                label: "Wifi",
                icon: "wifi.fill",
                selectedIcon: "wifi.white",
                isSelected: isSelected,
                action: { isSelected.toggle() }
            )
        }
    }

    return PreviewWrapper()
}
