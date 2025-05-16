
import SwiftUI

struct TenantCardView: View {
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
                    .padding(.bottom, 9)

                VStack(alignment: .leading, spacing: 5) {
                    Text(tenant.name)
                        .font(.custom("Poppins-SemiBold", size: 20))
                        .foregroundColor(.black.opacity(0.7))
                        .lineLimit(1)
                        .padding(.top, -6)

                    Text(tenant.openTime)
                        .foregroundColor(.gray)
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
            }

            HStack(spacing: 16) {
                NavigationLink(
                    destination:NavigationRouteView(tenant: tenant), // ✅ Use renamed view
                    label: {
                        Text("Directions")
                            .frame(width: 122, height: 12)
                            .font(.system(size: 16))
                            .padding()
                            .background(Color.breezeblue.opacity(0.14))
                            .foregroundColor(.breezeblue)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.breezeblue, lineWidth: 1.5)
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
                }
            }
            .font(.subheadline)
            .padding(.top, 0)
        }
        .padding()
        .background(Color.white)
    }
}
