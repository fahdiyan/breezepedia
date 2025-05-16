import SwiftUI
import MapKit

struct DirectionView: View {
    let tenant: TenantModel
    @State private var route: MKRoute?

    var body: some View {
        ZStack(alignment: .bottom) {
            MapViewWithRoute(destinationCoordinate: tenant.coordinate, route: $route)
                .ignoresSafeArea()

            if let route = route {
                VStack {
                    Text("Estimated time: \(Int(route.expectedTravelTime / 60)) min")
                    Text("Distance: \(String(format: "%.2f", route.distance / 1000)) km")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
                .transition(.move(edge: .bottom))
                .animation(.easeInOut, value: route)
            }
        }
        .navigationTitle(tenant.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
