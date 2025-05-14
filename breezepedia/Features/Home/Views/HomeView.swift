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
                    Color.purple.frame(width: 44, height: 44)
                        .cornerRadius(12)
                }
                .padding(16)
                
                Spacer()
                
                HStack {
                    Color.purple.frame(width: 44, height: 44)
                        .cornerRadius(12)
                    Spacer()
                    Color.purple.frame(width: 44, height: 44)
                        .cornerRadius(12)
                }
                .padding(16)
            }
        }
    }
}

#Preview {
    HomeView()
}
