//
//  SelectableButton.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 05/04/25.
//

import SwiftUI

struct CategoryButton: View {
    let label: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.custom("Poppins-Regular", size: 16))
                .padding(.horizontal, 20)
                .padding(.vertical, 6)
                .lineLimit(1)
                .foregroundColor(
                                   isSelected ? .white : .breezepurple
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
                    RoundedRectangle(cornerRadius: 6)
                    
                        
                        
                        .stroke(
                            Color(.breezepurple),
                            lineWidth: 2
                               
                        )

                )
                .cornerRadius(6)
        
                  .animation(.easeInOut(duration: 0.2), value: isSelected)
        
               
        }
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}
#Preview {
    struct PreviewWrapper: View {
        @State private var isSelected = false

        var body: some View {
            CategoryButton(
                label: "Dessert",
                isSelected: isSelected,
                action: { isSelected.toggle() }
            )
        }
    }

    return PreviewWrapper()
}
