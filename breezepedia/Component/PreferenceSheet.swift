//
//  PreferenceSheet.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 05/04/25.
//

import SwiftUI

struct ButtonItem : Identifiable{
    let id = UUID()
    let label : String;
    let icon : String;
}

struct PreferenceSheet: View {
    @Environment(\.dismiss) var dismiss
    @Binding var filterOptions: FilterOptions
    
    let categories = ["Local Dish", "Dessert", "Beverages", "Japanese Dish", "Coffee", "Seafood", "Protein", "Snacks", "Western Dish"]
    
    let facilityTexts = ["Wifi", "Halal", "Spacious", "Silent", "Cheap", "Pet Friendly", "Smoking Area", "Outdoor"]
    
    let facilityIcons = ["wifi.fill", "halal_circle", "room.fill", "silent.fill", "pricetag.fill", "pet.fill", "mdi_smoking-area", "outfoor.fill"]
    
    let selectedFacilityIcons = ["wifi.white", "halal.white.circle", "Room.white", "silent.white", "pricetag.white", "pet.white", "smoking.white", "outfoor.white"]
    
    @State private var selectedCategory: String? = nil
    @State private var selectedFacilities: Set<String> = []
    
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
                .foregroundColor(Color.black.opacity(0.7))
                .padding(.bottom, 16)
            
            CategoriesView(items: categories, selectedItem: $selectedCategory)
            
            Divider()
                .frame(height: 1)
                .overlay(.gray.opacity(0.3))
                .padding(.vertical, 20)
            
            Text("Any specific facilities you want to have?")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color.black.opacity(0.7))
                .padding(.bottom, 16)

            FacilitiesView(
                texts: facilityTexts,
                icons: facilityIcons,
                selectedIcons: selectedFacilityIcons,
                selectedLabels: $selectedFacilities
            )
            
            HStack {
                Spacer()
                
                Button(action: {
                    filterOptions = FilterOptions(
                        selectedCategory: selectedCategory,
                        selectedFacilities: selectedFacilities
                    )
                    dismiss()
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
                .padding(.top, 36)
                
                Spacer()
            }
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 40)
        .presentationDetents([.fraction(0.8), .large])
        .ignoresSafeArea(edges: .all)
    }
}

struct CategoriesView: View {
    let items: [String]
    @Binding var selectedItem: String?
    
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
    let selectedIcons: [String]
    @Binding var selectedLabels: Set<String>

    var body: some View {
        let items = Array(zip3(texts, icons, selectedIcons))
        let rows = [
            Array(items.prefix(4)),
            Array(items.dropFirst(4).prefix(4))
        ]

        VStack(spacing: 8) {
            ForEach(0..<rows.count, id: \.self) { rowIndex in
                HStack(spacing: 8) {
                    ForEach(0..<rows[rowIndex].count, id: \.self) { colIndex in
                        let item = rows[rowIndex][colIndex]
                        let label = item.0
                        FacilityButton(
                            label: label,
                            icon: item.1,
                            selectedIcon: item.2,
                            isSelected: selectedLabels.contains(label)
                        ) {
                            if selectedLabels.contains(label) {
                                selectedLabels.remove(label)
                            } else {
                                selectedLabels.insert(label)
                            }
                        }
                    }
                }
            }
        }
    }

    private func zip3<A, B, C>(_ a: [A], _ b: [B], _ c: [C]) -> [(A, B, C)] {
        Array(zip(a, zip(b, c))).map { ($0.0, $0.1.0, $0.1.1) }
    }
}

struct FilterOptions {
    var selectedCategory: String?
    var selectedFacilities: Set<String>
}

#Preview {
    StatefulPreviewWrapper(
        FilterOptions(selectedCategory: nil, selectedFacilities: [])
    ) { PreferenceSheet(filterOptions: $0) }
}
