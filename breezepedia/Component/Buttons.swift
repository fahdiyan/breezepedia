//
//  Buttons.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 14/05/25.
//

import SwiftUI

struct Buttons: View {
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: icon)
                .frame(width: 44, height: 44)
                .foregroundStyle(.white)
                .background(.purple)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
        }
    }
}
