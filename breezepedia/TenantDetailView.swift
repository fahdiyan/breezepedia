//
//  TenantDetailView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 26/03/25.
//

import SwiftUI

struct TenantDetailView: View {
    var tenant: TenantModel
    var menus = MenuModel.generateMenuModel()

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image(tenant.coverImage)
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
                                    Image(tenant.image)
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 90, height: 60)
                                        .padding(.top,15)
                                        .padding(.bottom,15)
                                    
                                    TenantInfoView(tenant: tenant)
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
                                
                                GeneralInfoView(tenant: tenant)
                                
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
                            .padding(.vertical, 24)
                            .padding(.horizontal, 30)
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
    var tenant: TenantModel
    var body: some View {
        VStack(alignment: .leading) {
            Icon(type: "price_circle", text: "Rp. \(tenant.cheapest). (Cheapest menu)")
            Icon(type: "wifi_circle", text: tenant.wifi ? "Wifi available" : "Wifi not available")
            Icon(type: "peak_hour_circle", text: "Peak hour: \(tenant.peakHour)")
            Icon(type: "capacity_circle", text: "Capacity: \(tenant.capacity) tables")
            Icon(type: "halal_circle", text: "Halal")
            Icon(type: "petfriendly_circle", text: "No Pets Allowed")
        }
    }
}

struct TenantInfoView: View {
    var tenant: TenantModel
    var body: some View {
        VStack(alignment: .leading) {
            Text(tenant.name)
                .font(.custom("Poppins-ExtraBold.ttf", size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 0, saturation: 0, brightness: 0))
                .frame(height: 30)
                .padding(.leading, 10)
                .padding(.top, 15)
            
            Text(tenant.category)
                .font(.custom("Poppins-Bold.ttf", size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 0, saturation: 0, brightness: 0.47))
                .frame(height: 20)
                .padding(.leading,10)
            
                
            Text(tenant.openTime)
                .font(.custom("Poppins-Regular", size: 16))
                .foregroundColor(Color(hue: 0, saturation: 0, brightness: 0.47))
                .padding(.leading,10)
                .padding(.bottom,15)
          
        }
    }
}

#Preview {
    TenantDetailView(tenant: dummyTenants[0])
}

