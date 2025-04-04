//
//  Screen.swift
//  breezepedia
//
//  Created by Raissa  on 03/04/25.
//

import SwiftUI

struct ScreenView: View {
    var body: some View {
        ZStack {
            Color(UIColor(
                red: 0x70 / 255,
                green: 0x42 / 255,
                blue: 0x9A / 255,
                alpha: 1
            )).ignoresSafeArea()
            
            VStack {
                Image("logo_breezepedia_white")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            Text("")
                .foregroundColor(.white)
                .font(.title)
                .bold()
        }
    }
}

#Preview {
    ScreenView()
}

