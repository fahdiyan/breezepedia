//
//  NavigationView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 09/04/25.
//

import SwiftUI

struct NavigationView: View {
    var tenant: TenantModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Color.clear
                        .frame(height: max(700, 0))
                    HStack {
                        Spacer()
                        VStack {
                            Icon(type: "exit", text: "Exit", isInlinetext: false, textSize: 14, color: Color(.white))
                            Divider()
                                .frame(height: 1)
                                .background(Color.white)
                                .overlay(.gray.opacity(0.3))
                            
                            Icon(type: "time", text: "5 min", isInlinetext: false, textSize: 14, color: Color(.white))
                            Divider()
                                .frame(height: 1)
                                .background(Color.white)
                                .overlay(.gray.opacity(0.3))
                            
                            Icon(type: "distance", text: "Exit", isInlinetext: false, textSize: 14, color: Color(.white))
                            Divider()
                                .frame(height: 1)
                                .background(Color.white)
                                .overlay(.gray.opacity(0.3))
                        }
                        .background(Color(UIColor(
                            red: 0x70 / 255,
                            green: 0x42 / 255,
                            blue: 0x9A / 255,
                            alpha: 1
                        )))
                        .cornerRadius(10)
                        .shadow(radius: 4)
                        .frame(width: 63, height: 223)
                    }
                    .padding()
                    
                }
                
                ZStack(alignment: .leading) {
                    Color.white
                        .frame(width: geometry.size.width)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 24)
                                .offset(x: 0, y: 0)
                        )
                        .shadow(radius: 4)
                    
                    VStack {
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.red)
                            Text("Destination")
                                .font(.custom("Poppins-Bold", size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hue: 0, saturation: 0, brightness: 0.47))
                        }
                        HStack {
                            Text(tenant.name)
                                .font(.custom("Poppins-ExtraBold", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color(UIColor(
                                    red: 0x70 / 255,
                                    green: 0x42 / 255,
                                    blue: 0x9A / 255,
                                    alpha: 1
                                )))
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 0)
                }
            }
            .ignoresSafeArea(.all, edges: .top)
            .edgesIgnoringSafeArea(.bottom)
            .padding(0)
            
        }
    }
}

#Preview {
    NavigationView(tenant: dummyTenants[0])
}
