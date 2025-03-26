//
//  TenantDetailView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 26/03/25.
//

import SwiftUI

struct TenantDetailView: View {
    var body: some View {
        ZStack {
            Color(.orange) // Change with Tenant Image here
                .ignoresSafeArea()
            GeometryReader { geometry in
                VStack {
                    Spacer() // Pushes the second layer down by 30%
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white)
                        .frame(height: geometry.size.height * 0.7) // Covers 70%
                        .shadow(radius: 5)
                }
            }
            .ignoresSafeArea(edges: .bottom) // Ensure it extends to the bottom
        }
    }
}

#Preview {
    TenantDetailView()
}

