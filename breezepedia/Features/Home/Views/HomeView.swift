//
//  HomeView.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 14/05/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.green.opacity(0.15)
                .ignoresSafeArea(.all)
            
            VStack (alignment: .center) {
                HStack {
                    Color.purple.frame(width: 300, height: 44)
                        .cornerRadius(12)
                    
                    Buttons(icon: "arrow.up.arrow.down", action: {})
                }
                .padding(16)
                
                Spacer()
                
                HStack {
                    Buttons(icon: "menucard", action: {})
                    Spacer()
                    Buttons(icon: "location", action: {})
                }
                .padding(16)
            }
        }
    }
}

#Preview {
    HomeView()
}
