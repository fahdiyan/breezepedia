//
//  Screen.swift
//  breezepedia
//
//  Created by Raissa  on 03/04/25.
//

import SwiftUI

struct ScreenView: View {
    @State private var isAltColor = true
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            if isActive {
                ContentView()
            } else {
                ZStack {
                    bgColor
                        .ignoresSafeArea()
                        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isAltColor)
                    
                    VStack {
                        Image("logo_breezepedia_purple")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                    }
                    Text("")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                }
                .transition(.opacity)
            }
        }
        .onAppear {
            isAltColor.toggle()
            // Ganti ke ContentView setelah 2 detik
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isActive = true
                }
            }
        }
        .animation(.easeInOut(duration: 1), value: isActive)
        
        
    }
    
    var bgColor: Color {
        isAltColor ?
        Color(UIColor(red: 0x70/255, green: 0x42/255, blue: 0x9A/255, alpha: 1)) :
        Color(.white)
    }
}

#Preview {
    ScreenView()
}

