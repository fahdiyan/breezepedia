//
//  MapBottomCard.swift
//  breezepedia
//
//  Created by Raissa  on 16/05/25.
//


import SwiftUI
import MapKit

struct MapBottomCardView: View {
    let tenant: TenantModel
    let route: MKRoute

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Capsule()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 40, height: 5)
                .padding(.top, 8)
                .frame(maxWidth: .infinity, alignment: .center)

            Text(tenant.name)
                .font(.title2).bold()

            Text("Estimated time: \(Int(route.expectedTravelTime / 60)) min")
                .font(.subheadline)

            Text("Distance: \(String(format: "%.2f", route.distance / 1000)) km")
                .font(.subheadline)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .cornerRadius(16)
        .shadow(radius: 5)
        .padding()
    }
}
