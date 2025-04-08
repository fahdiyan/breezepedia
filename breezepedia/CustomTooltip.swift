//
//  CustomTooltip.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 07/04/25.
//

import SwiftUI
import MapKit


struct CustomTooltip: View {
    var tenant: TenantModel
    @State private var goToDetail = false
    
    var body: some View {
//        NavigationStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image("peak_hour_circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    VStack(alignment: .leading) {
                        Text(tenant.name)
                            .font(.custom("Poppins-Bold", size: 16))
                            .fontWeight(.bold)
                        Text(tenant.openTime)
                            .font(.custom("Poppins-Bold", size: 10))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0, saturation: 0, brightness: 0.47))
                    }
                }
                Divider()
                    .frame(height: 0.75)
                    .overlay(.gray.opacity(0.3))
                    .padding(.vertical, 5)
                
                Icon(text: tenant.wifi ? "Wifi available" : "Wifi not available", textSize: 12, color: Color(.black), size: 20)
                Icon(type: "halal_circle", text: "Halal", textSize: 12, color: Color(.black), size: 20)
                Icon(type: "capacity_circle", text: "Capacity: 20 tables", textSize: 12, color: Color(.black), size: 20)
                
                HStack {
                    //                NavigationStack {
                    NavigationLink(
                        destination: TenantDetailView(tenant: tenant),
                        isActive: $goToDetail
                    ) {
                        Button() {
                            goToDetail = true
                        } label: {
                            Text("See details...")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 104, height: 26)
                                .background(Color(UIColor(
                                    red: 0x70 / 255,
                                    green: 0x42 / 255,
                                    blue: 0x9A / 255,
                                    alpha: 1
                                )))
                                .cornerRadius(5)
                                .shadow(radius: 4, y: 3)
                        }
                    }
                    Spacer()
                    Button() {
                        
                    } label: {
                        Image("navigation.white.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 17, height: 17)
                            .aspectRatio(contentMode: .fill)
                    }
                    .frame(width: 36, height: 26)
                    .background(.red)
                    .cornerRadius(5)
                    .shadow(radius: 4, y: 3)
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .toolbar(.hidden)
                //            }
                
                
            }
            .padding(10)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .shadow(radius: 4)
            .frame(width: 195, height: 215)
        }
//    }
}

#Preview {
    CustomTooltip(tenant: dummyTenants[0])
}
