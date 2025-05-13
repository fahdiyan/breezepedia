import SwiftUI

struct NavigationView: View {
    var tenant: TenantModel

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                // Map/Top content placeholder (no top right panel anymore)
                ZStack {
                    Color.clear.frame(height: max(700, 0))
                }

                // Bottom Card
                ZStack(alignment: .leading) {
                    Color.white
                        .frame(width: geometry.size.width)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .shadow(radius: 4)

                    VStack(spacing: 20) {
                        Capsule()
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 40, height: 5)
                            .padding(.top, 8)

                        // Start & Destination Section
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Start Point")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .foregroundColor(.gray)
                                    .padding(.bottom,4)
                                Text("Main Gate")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundColor(Color("breezepurple"))
                                    .foregroundColor(.gray)
                                    
                            }

                            Spacer()

                            Image(systemName: "arrow.right")
                                .foregroundColor(.breezeblue)
                                .font(.system(size: 24, weight: .bold)) // Increase weight to make it thicker


                             

                            Spacer()

                            VStack(alignment: .trailing, spacing: 4) {
                                Text("Destination")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .foregroundColor(.gray)
                                    .padding(.bottom,4)
                                Text(tenant.name)
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundColor(Color("breezepurple"))
                                  
                            }
                        }

                        // Divider between sections
                        Divider()
                            .padding(.horizontal, 0) // Optional: stretch divider edge to edge
                            .frame(height: 0.6) // Adjust the height to make the divider thicker
                                .background(Color.gray)
                        

                        // Duration, Distance, Exit Button
                        HStack {
                            Text("2 min")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                
                                .foregroundColor(Color("breezeblue"))
                            

                            Text("•")
                                .font(.custom("Poppins-SemiBold", size: 18))
                                .foregroundColor(.gray)

                            Text("150 m")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                
                                .foregroundColor(Color("breezeblue"))

                            Spacer()

                            Button(action: {
                                // Exit action
                            }) {
                                Text("Exit")
                                    .fontWeight(.bold)
                                    .frame(width: 160, height: 45)
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.top, 12)
                    .padding(.bottom, 80)

                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.3) // Adjust the height based on available space
                .padding(.top, -50) // Adjust for slight top movement
                .ignoresSafeArea(.container, edges: .bottom)
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    NavigationView(tenant: dummyTenants[0])
}
