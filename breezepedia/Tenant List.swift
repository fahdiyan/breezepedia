import SwiftUI
import MapKit

struct TenantListView: View {
    @State private var searchText = ""
    @State private var isShowingPreferences = false
    @State private var filterOptions = FilterOptions(selectedCategory: nil, selectedFacilities: [])

    
    var filteredTenants: [TenantModel] {
        if searchText.isEmpty {
            return dummyTenants
        } else {
            return dummyTenants.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack(spacing: 10) {
                    HStack(spacing: 8) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                                .padding(.leading,8)
                                .padding(.trailing,8)
                            
                            TextField("Search tenant", text: $searchText)
                                .foregroundColor(.black)
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.trailing,-6)
                        
                        Button(action: {
                            isShowingPreferences = true
                        }) {
                            Image(systemName: "slider.horizontal.3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding(.leading,12)
                        }
                        .frame(width: 44, height: 44)
                        .sheet(isPresented: $isShowingPreferences) {
                            PreferenceSheet(filterOptions: $filterOptions)
                        }
                    }
                    .frame(height:20)
                    .padding(.horizontal)
                    
                    HStack {
                        (
                            Text("Explore ") +
                            Text("every tenants").bold() +
                            Text(" available at The Breeze!")
                        )
                        .font(.system(size: 17))
                        .padding(.top, 6)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 5)
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
                .background(Color.breezepurple)
                .shadow(radius: 4, y: 2)
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(filteredTenants) { tenant in
                            TenantCard(tenant: tenant)
                                .contentShape(Rectangle())
                        }
                    }
                    .padding(.vertical)
                    .padding(.top,-5)
                }
            }
            .background(Color(.systemGray5))
        }
        .tint(Color.breezepurple)
    }
}

struct TenantCard: View {
    let tenant: TenantModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 20) {
                Image(tenant.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 153, height: 153)
                    .clipped()
                    .cornerRadius(5)
                    .padding(.top, 0)
                    .padding(.bottom,9)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(tenant.name)
                        .font(.custom("Poppins-SemiBold", size: 20))
                        .foregroundColor(.black.opacity(0.7))
                        .lineLimit(1)
                        .padding(.top, -6)
                    
                    Text(tenant.openTime)
                        .foregroundColor(.gray)
                        .padding(.bottom, 2)
                        .font(.custom("Poppins-Regular", size: 15))
                        .padding(.top, -3)
                    
                    Label {
                        Text("\(tenant.cheapest)")
                            .font(.custom("Poppins-Regular", size: 15))
                            .foregroundColor(.black.opacity(0.8))
                    } icon: {
                        Image(systemName: "tag")
                            .foregroundColor(Color("breezepurple"))
                    }
                    
                    Label {
                        Text("Capacity: \(tenant.capacity)")
                            .font(.custom("Poppins-Regular", size: 15))
                            .foregroundColor(.black.opacity(0.8))
                    } icon: {
                        Image(systemName: "square.3.stack.3d")
                            .foregroundColor(Color("breezepurple"))
                    }
                    
                    if tenant.wifi {
                        Label {
                            Text("Wifi Available")
                                .font(.custom("Poppins-Regular", size: 15))
                                .foregroundColor(.black.opacity(0.8))
                        } icon: {
                            Image(systemName: "wifi")
                                .foregroundColor(Color("breezepurple"))
                        }
                    }
                    
                    if tenant.halal {
                        Label {
                            Text("Halal")
                                .font(.custom("Poppins-Regular", size: 15))
                                .foregroundColor(.black.opacity(0.8))
                        } icon: {
                            Image(systemName: "checkmark.seal")
                                .foregroundColor(Color("breezepurple"))
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(0)
                .padding(.vertical, 1)
                .padding(.bottom,5)
            }
            
            HStack(spacing: 16) {
                NavigationLink(
                    destination: ContentView(selectedTenant: tenant),
                    label: {
                        Text("Directions")
                            .frame(width: 122, height: 12)
                            .font(.system(size: 16))
                            .padding()
                            .background(Color.breezeblue.opacity(0.14))
                            .foregroundColor(.breezeblue)
                            .cornerRadius(5)
                            .padding(.top,0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.breezeblue, lineWidth: 1.5)
                                    .padding(.top,0)
                            )
                    }
                )
                
                NavigationLink(destination: TenantDetailView(tenant: tenant)) {
                    Text("Menu & Details")
                        .frame(width: 160, height: 12)
                        .font(.system(size: 16))
                        .padding()
                        .background(Color.breezepurple)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .padding(.top, 0)
                }
            }
            .font(.subheadline)
            .padding(.top, 0)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(0)
    }
}

struct MapBottomCard: View {
    let tenant: TenantModel
    let route: MKRoute
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Estimated Time: \(Int(route.expectedTravelTime / 60)) min")
                .font(.headline)
            Text("Distance: \(String(format: "%.2f", route.distance / 1000)) km")
                .font(.subheadline)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    TenantListView()
}
