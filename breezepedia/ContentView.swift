//
//  ContentView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 26/03/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var showSheet = false
    @State private var selectedAnnotation: MKAnnotation?
    @State private var annotationPosition: CGPoint = .zero
    
    @State private var searchText: String = ""
    
    var filteredTenants: [String: TenantModel] {
        if searchText.isEmpty {
            return dummyTenantsDict
        } else {
            return dummyTenantsDict.filter {
                $0.value.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                CustomMapView(tenants: filteredTenants)
                    .edgesIgnoringSafeArea(.all)
                
                VStack (alignment: .center) {
                    // Main Header
                    VStack {
                        Spacer()
                        HStack {
                            Image("logo_breezepedia_white")
                                .resizable()
                                .frame(width: 82, height: 65)
                            Spacer()
                            SearchField(searchText: $searchText, hintText: "Search tenant")
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 18)
                        
                        HStack {
                            Text("Let's explore ")
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
                    
                    // Preference Button
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
}

#Preview {
    ContentView()
}
