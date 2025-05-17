import SwiftUI

struct NavigationRouteView: View {
    var tenant: TenantModel
    
    @Environment(\.dismiss) var dismiss // This allows us to dismiss the current view
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                // Map/Top content placeholder
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
                                    .padding(.bottom, 4)
                                
                                Text("Main Gate")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundColor(Color("breezepurple"))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.breezeblue)
                                .font(.system(size: 24, weight: .bold))
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 4) {
                                Text("Destination")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 4)
                                
                                Text(tenant.name)
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundColor(Color("breezepurple"))
                            }
                        }
                        
                        // Divider
                        Divider()
                            .padding(.horizontal, 0)
                            .frame(height: 0.6)
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
                                dismiss() // This will go back to the previous view
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
                .frame(width: geometry.size.width, height: geometry.size.height * 0.3)
                .padding(.top, -50)
                .ignoresSafeArea(.container, edges: .bottom)
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    NavigationRouteView(tenant: dummyTenants[0])
}
