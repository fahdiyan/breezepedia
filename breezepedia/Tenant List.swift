import SwiftUI

struct Tenant: Identifiable {
    let id = UUID()
    let name: String
    let logo: String
    let openHours: String
    let priceRange: String
    let capacity: String
    let hasWifi: Bool
    let isHalal: Bool
}

let sampleTenants = [
    Tenant(name: "J.co", logo: "tenantA_logo", openHours: "08.00 – 22.00", priceRange: "Rp.30,000 - Rp.90,000", capacity: "20 tables", hasWifi: true, isHalal: true),
    Tenant(name: "Tenant B", logo: "tenantB_logo", openHours: "09.00 – 21.00", priceRange: "Rp 40.000 - Rp 90.000", capacity: "15 tables", hasWifi: true, isHalal: true),
    Tenant(name: "Tenant C", logo: "tenantB_logo", openHours: "09.00 – 21.00", priceRange: "Rp 30.000 - Rp 90.000", capacity: "15 tables", hasWifi: true, isHalal: true),
    Tenant(name: "Tenant C", logo: "tenantB_logo", openHours: "09.00 – 21.00", priceRange: "Rp 30.000 - Rp 90.000", capacity: "15 tables", hasWifi: true, isHalal: true),
    Tenant(name: "Tenant C", logo: "tenantB_logo", openHours: "09.00 – 21.00", priceRange: "Rp 30.000 - Rp 90.000", capacity: "15 tables", hasWifi: true, isHalal: true)
]

struct TenantListView: View {
    @State private var searchText = ""

    var filteredTenants: [Tenant] {
        if searchText.isEmpty {
            return sampleTenants
        } else {
            return sampleTenants.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header with Search & Subtitle
                VStack(spacing: 10)
                {
                    // Search bar + Filter button
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
                            // Handle filter tap
                        }) {
                            Image(systemName: "slider.horizontal.3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding(.leading,12)
                        }
                        .frame(width: 44, height: 44)
                    }
                    .frame(height:10)
                    .padding(.horizontal)

                    // Subtitle
                    HStack {
                        (
                            Text("Explore ") +
                            Text("every tenants").bold() +
                            Text(" available at The Breeze!")
                        )
                        .font(.system(size: 17))
                        .padding(.top, 10)
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

                // Tenant Cards
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
            .background(Color(.systemGray5)) // Light grey background
        }
    }
}

struct TenantCard: View {
    let tenant: Tenant

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 20)
            {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 153, height: 164)
                    .background(Color(red: 0, green: 0.33, blue: 0.2))
                    .cornerRadius(5)
                    .padding(.top, 0)
                    .padding(.leading, 0)
                    .padding(.trailing,-2)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Kenangan Signature")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black.opacity(0.8))
                   
                        .padding(.top, -4)
                        .padding(.bottom, 0) // Change 4 to your desired spacing


                    Text("Open \(tenant.openHours)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 2)
                        .font(.system(size: 15))
                    
                      

                    Label {
                        Text(tenant.priceRange)
                            .font(.system(size: 14))
                            .foregroundColor(.black.opacity(0.8))
                    } icon: {
                        Image(systemName: "tag")
                            .foregroundColor(Color("breezepurple")) // Icon color only
                    }

                    
                      
                    

                    Label {
                        Text("Capacity: \(tenant.capacity)")
                            .font(.system(size: 14))
                            .foregroundColor(.black.opacity(0.8))
                    } icon: {
                        Image(systemName: "square.3.stack.3d")
                            .foregroundColor(Color("breezepurple"))
                    }

                    
                    


                    if tenant.hasWifi {
                        Label {
                            Text("Wifi Available")
                                .font(.system(size: 14))
                                .foregroundColor(.black.opacity(0.8))
                        } icon: {
                            Image(systemName: "wifi")
                                .foregroundColor(Color("breezepurple"))
                        }
                
                    }

                    if tenant.isHalal {
                        Label {
                            Text("Halal")
                                .font(.system(size: 14))
                                .foregroundColor(.black.opacity(0.8))
                        } icon: {
                            Image(systemName: "checkmark.seal")
                                .foregroundColor(Color("breezepurple"))
                        }
                     
                    }
                }
                .background(Color.white)
                .cornerRadius(0)
                .padding(.vertical, 4) // Keeps vertical spacing but aligns horizontally
            }

            // Adjustable top padding for buttons
            HStack(spacing: 16) {
                // Directions Button with stroke
                Button(action: {
                    // Handle directions
                }) {
                    Text("Directions")
                        .frame(width: 122, height: 12)
                        .font(.system(size: 16))
                        .padding()
                        .background(Color.breezeblue.opacity(0.15))
                        .foregroundColor(.teal)
                        .cornerRadius(5)
                        .padding(.top,2)
                    
                        .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.breezeblue, lineWidth: 1.5) // ✅ Stroke here
                            .padding(.top,2)
                        
                        )
                }

                // Menu & Details Button
                Button(action: {
                    // Handle details
                }) {
                    Text("Menu & Details")
                        .frame(width: 160, height: 12)
                        .font(.system(size: 16))
                        .padding()
                        .background(Color.breezepurple)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .padding(.top,2)
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


#Preview {
    TenantListView()
}
