//
//  CustomAnnotation.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 15/05/25.
//

import SwiftUI

struct CustomAnnotation: View {
    let systemImageName: String
    let tintColor: Color

    var body: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundColor(.orange)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
            Image(systemName: systemImageName)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(tintColor)
        }
    }
}

struct CustomAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnnotation(
            systemImageName: "bolt.horizontal.fill",
            tintColor: .white
        )
    }
}
