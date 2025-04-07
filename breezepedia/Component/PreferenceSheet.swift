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
    
    let facilityTexts = ["Wifi", "Halal", "Spacious", "Silent", "Cheap", "Pet Friendly", "Smoking Area", "Rooftop"]
    let facilityIcons = ["wifi_circle", "wifi_circle", "wifi_circle", "wifi_circle", "wifi_circle", "wifi_circle", "wifi_circle", "wifi_circle"]
//    let facilityIcons = ["wifi", "halal", "spacious", "silents", "cheap", "pet_friendly", "smoking_area", "rooftop"]
        
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
                .padding(.vertical, 20)
            
            Text("Any specific facilities you want to have?")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color.black.opacity(0.6))
                .padding(.bottom, 20)

            FacilitiesView(texts: facilityTexts, icons: facilityIcons)
            
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
        .padding(.leading, 20)
        .padding(.trailing, 20)

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

struct FacilitiesView: View {
    let texts: [String]
    let icons: [String]

    @State private var selectedIndexes: Set<Int> = []

    var body: some View {
        let items = Array(zip(texts, icons))
        let rows = [
            Array(items.prefix(4)),
            Array(items.dropFirst(4).prefix(4))
        ]

        VStack(spacing: 12) {
            ForEach(0..<rows.count, id: \.self) { rowIndex in
                HStack(spacing: 12) {
                    ForEach(0..<rows[rowIndex].count, id: \.self) { colIndex in
                        let index = rowIndex * 4 + colIndex
                        FacilityButton(
                            label: rows[rowIndex][colIndex].0,
                            icon: rows[rowIndex][colIndex].1,
                            isSelected: selectedIndexes.contains(index)
                        ) {
                            if selectedIndexes.contains(index) {
                                selectedIndexes.remove(index)
                            } else {
                                selectedIndexes.insert(index)
                            }
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
