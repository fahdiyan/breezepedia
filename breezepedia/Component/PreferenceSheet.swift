//
//  PreferenceSheet.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 05/04/25.
//


import SwiftUI

struct ContentPreference: View {
    @State private var price: Double = 50.0  // Starting value

    var body: some View {
        VStack(spacing: 20) {
            Text("Selected Price: $\(Int(price))")
                .font(.headline)

            Slider(value: $price, in: 0...100, step: 1)
                .accentColor(Color("BreezeBlue")) // assuming you've defined this in Assets
                .padding()

            Spacer()
        }
        .padding()
    }
}



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
    @State private var priceRange: ClosedRange<Double> = 20000...300000

    
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
                    .padding(.trailing,14)
            }
            
            Text("What’s on your mood today?")
                .font(.custom("Poppins-SemiBold", size: 16))
                .foregroundColor(Color.black.opacity(0.7))
                .padding(.bottom, 12)
                .padding(.leading,14)
            
            
     
            CategoriesView(items: categories, selectedItem: $selectedCategory)
            
            Divider()
                .frame(height: 1)
                .overlay(.gray.opacity(0.3))
               
                .padding(.top,15)
                .padding(.leading,14)
                .padding(.trailing,14)
            
            Text("Adjust the budget, maybe?")
                .font(.custom("Poppins-SemiBold", size: 16))
                .foregroundColor(Color.black.opacity(0.7))
                .padding(.top, 15)
                .padding(.leading,14)

            HStack {
                
                Text("0k")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Slider(value: Binding(
                    get: { priceRange.upperBound },
                    set: { priceRange = 20000...$0 }
                ), in: 20000...167000)
                .accentColor(.breezeblue)
                Text("999k")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }

            
            
            
            
            
            Divider()
                .frame(height: 1)
                .overlay(.gray.opacity(0.3))
                .padding(.top,15)
                .padding(.bottom,15)
                .padding(.leading,14)
                .padding(.trailing,14)
               
            
            HStack {
                Text("Any specific facilities?")
                    .font(.custom("Poppins-SemiBold", size: 16))
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding(.leading,14)
                    .lineLimit(1)
                

                Spacer()

                Button(action: {
                    filterOptions.selectedCategory = nil
                    filterOptions.selectedFacilities = []
                }) {
                    Text("Reset Filter")
                        .font(.custom("Poppins-Regular", size: 16))
                        .foregroundColor(.red)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .padding(.trailing,8)
            
                }
            }


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
                        .frame(width: 360, height: 48)
                        .background(.breezepurple)
                        .cornerRadius(5)
                        .shadow(radius: 4, y: 3)
                }
                .padding(.top, 20)
                
                Spacer()
            }
        }
        .padding(.horizontal, 40)
//        .padding(.vertical, 40)
//        .presentationDetents([.fraction(0.8), .large])
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
