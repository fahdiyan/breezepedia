//
//  ContentView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 26/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            // MapKit
            
            VStack (alignment: .center) {
                VStack {
                    Spacer()
                    HStack {
                        Image("logo_breezepedia_white")
                            .resizable()
                            .frame(width: 82, height: 65)
                        Spacer()
                        SearchField()
                    }
//                    .padding(.horizontal, 24)
                    .padding(.leading, 15)
                    .padding(.trailing, 25)
                    
                    HStack {
                        Text("Go explore ")
                            .font(.system(size: 16, weight: .regular)) +
                        Text("52 tenants")
                            .font(.system(size: 16, weight: .bold)) +
                        Text(" available at The Breeze!")
                            .font(.system(size: 16, weight: .regular))
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 15)
                }
                .frame(width: .infinity, height: 125)
                .background(Color(UIColor(
                    red: 0x70 / 255,
                    green: 0x42 / 255,
                    blue: 0x9A / 255,
                    alpha: 1
                )))
                .padding(.top, 45)
                .shadow(radius: 4, y: 2)
                
                Spacer()
                
                Button(action: {
                    showSheet.toggle()
                }) {
                    Text("Choose Preference")
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
                .sheet(isPresented: $showSheet) {
                    PreferenceSheet()
                        .cornerRadius(25)
                }
                .padding(.bottom, 64)
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct SearchField: View {
    @State private var searchText: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(UIColor(
                    red: 0x70 / 255,
                    green: 0x42 / 255,
                    blue: 0x9A / 255,
                    alpha: 1
                )))
                .padding(.leading, 15)
                .fixedSize()

            TextField("Search tenant", text: $searchText)
        }
        .frame(width: Double.infinity, height: 45)
        .background(Color.white)
        .cornerRadius(8)
    }
}

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
            
            FlexibleGridView(items: outlineButtons)
            
           
//            Divider()
//                .frame(height: 1)
//                .overlay(.gray.opacity(0.3))
//                .padding(.vertical, 16)
            
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

struct FlexibleGridView: View {
    let items: [String]
    
    var body: some View {
        FlowLayout(items: items) { item in
            Text(item)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .foregroundColor(Color(UIColor(
                    red: 0x70 / 255,
                    green: 0x42 / 255,
                    blue: 0x9A / 255,
                    alpha: 1
                )))
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(
                            Color(UIColor(
                                red: 0x70 / 255,
                                green: 0x42 / 255,
                                blue: 0x9A / 255,
                                alpha: 1
                            )),
                            lineWidth: 2
                        )
                )
        }
    }
}

struct FlowLayout<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    let items: Data
    let content: (Data.Element) -> Content
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return ZStack(alignment: .topLeading) {
            ForEach(items, id: \..self) { item in
                self.content(item)
                    .padding(6)
                    .alignmentGuide(.leading, computeValue: { d in
                        if abs(width - d.width) > geometry.size.width {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if item == self.items.last { width = 0 } else { width -= d.width }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if item == self.items.last { height = 0 }
                        return result
                    })
            }
        }
    }
}

#Preview {
    ContentView()
}
