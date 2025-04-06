//
//  PreferenceSheet.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 05/04/25.
//

import SwiftUI

struct ButtonItem : Identifiable{
    let id = UUID() // Unique identifier for each item
    let label : String;
    let icon : String;
}

struct PreferenceSheet: View {
    @Environment(\.dismiss) var dismiss
    
    let outlineButtons = ["Western", "Dessert", "Beverages", "Japanese", "Coffee", "Seafood", "Healty", "Snacks", "Rice", "Sate"]
    
    let gridButtonsNew: [ButtonItem] = [
        ButtonItem(label: "Free Wifi", icon: "star"),
        ButtonItem(label: "Halal", icon: "wifi"),
        ButtonItem(label: "Spacious", icon: "star"),
        ButtonItem(label: "Silent", icon: "mute"),
        ButtonItem(label: "Cheap", icon: "tag"),
        ButtonItem(label: "Pet Friendly", icon: "cat"),
        ButtonItem(label: "Smoking Area", icon: "smoking"),
        ButtonItem(label: "Rooftop", icon: "house"),
    ]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image(systemName: "xmark")
                    .resizable()
                    .fontWeight(.bold)
                    .foregroundColor(Color(UIColor(
                        red: 0x70 / 255,
                        green: 0x42 / 255,
                        blue: 0x9A / 255,
                        alpha: 1
                    )))
                    .frame(width: 18, height: 18)
                    .onTapGesture { dismiss() }
            }
            
            Text("What’s on your mood today?")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color.black.opacity(0.6))
                .padding(.bottom, 16)
            
            CategoriesView(items: outlineButtons)
           
            Divider()
                .frame(height: 1)
                .overlay(.gray.opacity(0.3))
                .padding(.vertical, 16)
            
            Text("Any specific facilities you want to have?")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color.black.opacity(0.6))
                .padding(.bottom, 20)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 4), spacing: 16) {
                ForEach(gridButtonsNew) { item in
                    VStack {
                        Image(systemName: item.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)

                        Text(item.label)
                            .font(.caption)
                            
                    }
                    .frame(width: 76, height: 76)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            
            HStack {
                Spacer()
                
                Button(action: {
                    // Apply Filter
                }) {
                    Text("Apply Filter")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .frame(width: 220, height: 48)
                        .background(Color(UIColor(
                            red: 0x70 / 255,
                            green: 0x42 / 255,
                            blue: 0x9A / 255,
                            alpha: 1
                        )))
                        .cornerRadius(10)
                        .shadow(radius: 4, y: 3)
                }
                .padding(.vertical, 36)
                
                Spacer()
            }
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 40)
        .presentationDetents([.fraction(0.8), .large])
        .ignoresSafeArea(edges: .all)
    }
}

struct CategoriesView: View {
    let items: [String]
    
    @State private var selectedItem: String? = nil
    
    var rows: [[String]] {
        [
            Array(items.prefix(3)),
            Array(items.dropFirst(3).prefix(3)),
            Array(items.dropFirst(6))
        ]
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { item in
                        CategoryButton(
                            label: item,
                            isText: true,
                            isSelected: selectedItem == item
                        ) {
                            selectedItem = selectedItem == item ? nil : item
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PreferenceSheet()
}
