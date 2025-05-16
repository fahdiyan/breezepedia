//
//  ContentView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 26/03/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var selectedTenant: TenantModel?
    @State private var showSheet = false
    @State private var selectedAnnotation: MKAnnotation?
    @State private var annotationPosition: CGPoint = .zero
    @State private var searchText: String = ""
    
    @State private var route: MKRoute?
    @State private var entranceCoordinate = CLLocationCoordinate2D(latitude: -6.301453293388013, longitude: 106.653222511091)
    @State private var routingDestinationKey: String? = nil
    
    @State private var filterOptions = FilterOptions(selectedCategory: nil, selectedFacilities: [])
    @State private var navigateToTenantList = false
    
    var filteredTenants: [String: TenantModel] {
        dummyTenantsDict.filter { _, tenant in
            let matchesSearch = searchText.isEmpty ||
            tenant.name.lowercased().contains(searchText.lowercased()) ||
            tenant.category.lowercased().contains(searchText.lowercased())
            
            let matchesCategory = filterOptions.selectedCategory == nil ||
            tenant.category.lowercased().contains(filterOptions.selectedCategory!.lowercased())
            
            let matchesFacilities = filterOptions.selectedFacilities.allSatisfy { facility in
                switch facility.lowercased() {
                case "wifi": return tenant.wifi
                case "halal": return tenant.halal
                case "spacious": return tenant.isSpacious
                case "silent": return tenant.isQuiet
                case "cheap": return tenant.isCheap
                case "pet friendly": return tenant.pet
                case "smoking area": return tenant.hasSmokingArea
                case "outdoor": return tenant.hasOutdoor
                default: return true
                }
            }
            
            return matchesSearch && matchesCategory && matchesFacilities
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                CustomMapView(
                    selectedTenant: selectedTenant,
                    tenants: filteredTenants
                )
                .edgesIgnoringSafeArea(.all)
                
                NavigationRouteView(tenant: selectedTenant!)
            }
            .onAppear {
                if let tenant = selectedTenant {
                    calculateRoute(to: tenant.coordinate, key: tenant.name)
                }
            }
        }
        .tint(Color.breezepurple)
    }
    
    func calculateRoute(to destination: CLLocationCoordinate2D, key: String) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: entranceCoordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let route = response?.routes.first {
                self.route = route
                self.routingDestinationKey = key // simpan tujuan
            } else {
                print("Error getting directions: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
}

#Preview {
    ContentView(selectedTenant: dummyTenants.first)
}

