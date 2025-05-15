import SwiftUI

struct TenantListView: View {
    @State private var searchText = ""
    @State private var isShowingPreferences = false // <--- New state for sheet
    @State private var filterOptions = FilterOptions(selectedCategory: nil, selectedFacilities: []) // <--- New state for selected filters

    var filteredTenants: [TenantModel] {
        // You can later apply `filterOptions` here too
        if searchText.isEmpty {
            return dummyTenants
        } else {
            return dummyTenants.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header with Search & Subtitle
                VStack(spacing: 10) {
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
                            isShowingPreferences = true // 👈 Show sheet on tap
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

                    // Subtitle
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
            .background(Color(.systemGray5))
        }
        .tint(Color.breezepurple)
    }
}


struct TenantCard: View {
    let tenant: TenantModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 20)
            {
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .frame(width: 153, height: 164)
//                    .background(Color(red: 0, green: 0.33, blue: 0.2))
//                    .cornerRadius(5)
//                    .padding(.top, 0)
//                    .padding(.leading, 0)
//                    .padding(.trailing,-2)
                Image(tenant.image) // Replace with your image asset name
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 153, height: 153) // rectangle size
                    .clipped() // ensures the image doesn't overflow the frame
                    .cornerRadius(5)
                    .padding(.top, 0)
                    .padding(.bottom,9)

                VStack(alignment: .leading, spacing: 5) {
                    Text(tenant.name)
                        .font(.custom("Poppins-SemiBold", size: 20))
                        .foregroundColor(.black.opacity(0.7))
                        .lineLimit(1)
                   
                        .padding(.top, -6)
                        .padding(.bottom, 0) // Change 4 to your desired spacing


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
                            .foregroundColor(Color("breezepurple")) // Icon color only
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
                .padding(.vertical, 1) // Keeps vertical spacing but aligns horizontally
                .padding(.bottom,5)
            }

            // Adjustable top padding for buttons
            HStack(spacing: 16) {
                // Directions Button with stroke
                NavigationLink(
                    destination: NavigationView(tenant: tenant),
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
                                    .stroke(Color.breezeblue, lineWidth: 1.5) // ✅ Stroke here
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


#Preview {
    TenantListView()
}
