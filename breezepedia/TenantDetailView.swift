//
//  TenantDetailView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 26/03/25.
//

import SwiftUI

struct TenantDetailView: View {
    private var menus = MenuModel.generateMenuModel()

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image("tenant-1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: 360)
                
                ScrollView {
                    VStack(spacing: 0) {
                        Color.clear
                            .frame(height: max(240, 0))
                        
                        ZStack {
                            Color.white
                                .frame(width: geometry.size.width)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 24)
                                        .offset(x: 0, y: 0)
                                )
                                .shadow(radius: 4)
                            
                            VStack(alignment: .leading) {
                                // Logo & Name
                                HStack {
                                    Image("logo_jco")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 120, height: 100)
                                    
                                    TenantInfoView()
                                }
                                
                                // General Info
                                Divider()
                                    .frame(height: 1)
                                    .overlay(.gray.opacity(0.3))
                                    .padding(.vertical, 16)
                                
                                Text("Tenant Detail")
                                    .frame(width: 132, height: 28)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                    .background(Color(UIColor(
                                        red: 0x70 / 255,
                                        green: 0x42 / 255,
                                        blue: 0x9A / 255,
                                        alpha: 1
                                    )))
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .padding(.bottom, 16)
                                
                                GeneralInfoView()
                                
                                // Menu List
                                Divider()
                                    .frame(height: 1)
                                    .overlay(.gray.opacity(0.3))
                                    .padding(.vertical, 16)
                                
                                Text("Menu List")
                                    .frame(width: 132, height: 28)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                    .background(Color(UIColor(
                                        red: 0x70 / 255,
                                        green: 0x42 / 255,
                                        blue: 0x9A / 255,
                                        alpha: 1
                                    )))
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .padding(.bottom, 16)
                                
                                VStack(spacing: 18) {
                                    ForEach(menus) { menu in
                                        MenuCard(menu: menu)
                                    }
                                }
                            }
                            .padding(.vertical, 36)
                            .padding(.horizontal, 32)
                        }
                    }
                }
                .scrollBounceBehavior(.basedOnSize)
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // Navigation
                    }) {
                        Image("navigation_circle_sticky")
                            .resizable()
                            .frame(width: 66, height: 66)
                            .padding(.vertical, 50)
                            .padding(.horizontal, 32)
                            .shadow(radius: 4, y: 3)
                    }
                }
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct GeneralInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Icon(type: "price_circle", text: "Rp. 10,000 (Cheapest menu)")
            Icon(type: "wifi_circle", text: "Wifi available")
            Icon(type: "peak_hour_circle", text: "Peak hour: 13.00 pm - 16.00 pm")
            Icon(type: "capacity_circle", text: "Capacity: 16 tables")
            Icon(type: "halal_circle", text: "Halal")
            Icon(type: "petfriendly_circle", text: "No Pets Allowed")
        }
    }
}

struct TenantInfoView: View {
    var name: String = "J.Co"
    var category: String = "Coffee and Donuts"
    var info: String = "Open 08.00 - 20.00"
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.custom("Poppins-ExtraBold", size: 30))
                .fontWeight(.bold)
                .foregroundColor(Color(UIColor(
                    red: 0x70 / 255,
                    green: 0x42 / 255,
                    blue: 0x9A / 255,
                    alpha: 1
                )))
                .frame(height: 30)
            Text(category)
                .font(.custom("Poppins-Bold", size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color(UIColor(
                    red: 0x70 / 255,
                    green: 0x42 / 255,
                    blue: 0x9A / 255,
                    alpha: 1
                )))
                .frame(height: 20)
            Text(info)
                .font(.custom("Poppins-Regular", size: 16))
                .foregroundColor(Color(UIColor(
                    red: 0x70 / 255,
                    green: 0x42 / 255,
                    blue: 0x9A / 255,
                    alpha: 1
                )))
        }
    }
}

#Preview {
    TenantDetailView()
}

