//
//  NavigationView.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 09/04/25.
//

import SwiftUI
import MapKit

struct RouteCardView: View {
    @Binding var showNavigation: Bool
    var tenant: TenantModel
    @Binding var selectedAnnotation: TenantAnnotation?
    @Binding var mapViewRef: MKMapView?
    @Binding var selectedTenantKey: String?
    @Binding var route: MKRoute?
    @Binding var showEntranceAnnotation: Bool
    @Binding var routingDestinationKey: String?
    @StateObject var tipManager = TipSequenceManager()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Color.clear
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                self.showNavigation.toggle()
                                self.selectedAnnotation = nil
                                self.mapViewRef = nil
                                self.selectedTenantKey = nil
                                self.route = nil
                                self.showEntranceAnnotation = false
                                self.routingDestinationKey = nil
                            }) {
                                Icon(type: "exit", text: "Exit", isInlinetext: false, textSize: 14, color: Color(.white))
                                    .padding(.top, 10)
                            }
                            .popoverTip(ExitTip(), arrowEdge: .bottom)

                            Divider()
                                .frame(height: 1)
                                .background(Color.white)
                                .overlay(.gray.opacity(0.3))
                            
                            Icon(type: "time", text: "5 min", isInlinetext: false, textSize: 14, color: Color(.white))
//                                .popoverTip(TimeTip(), arrowEdge: .bottom)
                            Divider()
                                .frame(height: 1)
                                .background(Color.white)
                                .overlay(.gray.opacity(0.3))
                            
                            Icon(type: "distance", text: "200 m", isInlinetext: false, textSize: 14, color: Color(.white))
//                                .popoverTip(DistanceTip(), arrowEdge: .bottom)
                            
                            Divider()
                                .frame(height: 1)
                                .background(Color.white)
                                .overlay(.gray.opacity(0.3))
                        }
                        .background(Color(UIColor(
                            red: 0x70 / 255,
                            green: 0x42 / 255,
                            blue: 0x9A / 255,
                            alpha: 1
                        )))
                        .cornerRadius(10)
                        .shadow(radius: 4)
                        .frame(width: 63, height: 223)
                        .padding(.top, 350)
                    }
                    .padding()
                    
                }
                
                ZStack(alignment: .leading) {
                    Color.white
                        .frame(width: geometry.size.width)
                        .frame(height: 150)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 24)
                                .offset(x: 0, y: 0)
                        )
                        .shadow(radius: 4)
                    
                    VStack {
                        HStack {
                            
                            Text("Destination:")
                                .font(.custom("Poppins-Bold", size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hue: 0, saturation: 0, brightness: 0.47))
                        }
                        HStack {
                            
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 14, height: 14)
                                .foregroundColor(.red)
                            Text(tenant.name)
                                .font(.custom("Poppins-ExtraBold", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color(UIColor(
                                    red: 0x70 / 255,
                                    green: 0x42 / 255,
                                    blue: 0x9A / 255,
                                    alpha: 1
                                )))
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 0)
                }
            }
            .ignoresSafeArea(.all, edges: .top)
            .edgesIgnoringSafeArea(.bottom)
            .padding(0)
            
        }
    }
}

#Preview {
    RouteCardView(showNavigation: Binding.constant(true), tenant: dummyTenants[0], selectedAnnotation: Binding.constant(nil), mapViewRef: Binding.constant(nil), selectedTenantKey: Binding.constant(nil), route: Binding.constant(nil), showEntranceAnnotation: Binding.constant(true), routingDestinationKey: Binding.constant(nil))
}
