//
//  HomeView.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 14/05/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = MapViewModel()
    
    @ViewBuilder
    var body: some View {
        ZStack {
            if let image = UIImage(named: "breezeMap2") {
                MapView(
                    region: MapRegion.breezeMapRegion,
                    overlayImage: image,
                    tenants: dummyTenants2,
                    viewModel: viewModel
                )
                .ignoresSafeArea()
            } else {
                Text("Map tidak tersedia")
            }
            
            VStack (alignment: .center) {
                HStack {
                    Color.white.frame(width: 300, height: 44)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    
                    CustomButton(
                        type: .primary,
                        width: .mini,
                        icon: "arrow.up.arrow.down",
                        action: {}
                    )
                }
                .padding(16)
                
                Spacer()
                
                HStack {
                    CustomButton(
                        type: .secondary,
                        width: .mini,
                        icon: "menucard",
                        action: {}
                    )
                    Spacer()
                    CustomButton(
                        type: .secondary,
                        width: .mini,
                        label: nil,
                        icon: "location",
                        action: {}
                    )
                }
                .padding(16)
            }
        }
    }
}

#Preview {
    HomeView()
}
