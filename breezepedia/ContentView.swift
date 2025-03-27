//
//  ContentView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 26/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // MapKit
            
            VStack (alignment: .center) {
                VStack {
                    Spacer()
                    HStack {
                        Image("logo_breezepedia_white")
                            .resizable()
                            .frame(width: 80, height: 60)
                        Spacer()
                        SearchField()
                    }
                    .padding(.horizontal, 24)
                    
                    HStack {
                        Text("Let’s explore ")
                            .font(.system(size: 16, weight: .regular)) +
                        Text("52 Tenants")
                            .font(.system(size: 16, weight: .bold)) +
                        Text(" at the Breeze!")
                            .font(.system(size: 16, weight: .regular))
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 14)
                }
                .frame(width: .infinity, height: 128)
                .background(Color(UIColor(
                    red: 0x70 / 255,
                    green: 0x42 / 255,
                    blue: 0x9A / 255,
                    alpha: 1
                )))
                .padding(.top, 32)
                .shadow(radius: 6, y: 3)
                
                Spacer()
                
                // Button Preferensi
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
                .padding(.leading, 10)

            TextField("Search...", text: $searchText)
        }
        .frame(width: 248, height: 40)
        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    ContentView()
}
