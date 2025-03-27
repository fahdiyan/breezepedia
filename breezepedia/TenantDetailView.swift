//
//  TenantDetailView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 26/03/25.
//

import SwiftUI

struct TenantDetailView: View {
    private var menus = MenuModel.generateMenuModel()
    
    @State private var offset: CGFloat = 240

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
                            .frame(height: max(offset, 0))
                        
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
                                
                                // General Info
                                Divider()
                                    .frame(height: 1)
                                    .overlay(.gray.opacity(0.3))
                                    .padding(.vertical, 16)
                                
                                Text("Tenant Detail")
                                    .frame(width: 132, height: 28)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                    .background(.purple)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .padding(.bottom, 16)
                                // ...
                                
                                
                                // Menu List
                                Divider()
                                    .frame(height: 1)
                                    .overlay(.gray.opacity(0.3))
                                    .padding(.vertical, 16)
                                
                                Text("Menu List")
                                    .frame(width: 132, height: 28)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                    .background(.purple)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .padding(.bottom, 16)
                                
                                VStack(spacing: 12) {
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
                            .padding(.vertical, 40)
                            .padding(.horizontal, 32)
                            .shadow(radius: 4)
                    }
                }
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TenantDetailView()
}

