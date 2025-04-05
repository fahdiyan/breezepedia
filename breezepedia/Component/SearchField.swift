//
//  SearchField.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 05/04/25.
//

import SwiftUI

struct SearchField: View {
    @State private var searchText: String = ""
    
    var hintText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(UIColor(
                    red: 0x70 / 255,
                    green: 0x42 / 255,
                    blue: 0x9A / 255,
                    alpha: 1
                )))
                .padding(.leading, 15)
                .fixedSize()

            TextField(hintText, text: $searchText)
        }
        .frame(width: Double.infinity, height: 45)
        .background(Color.white)
        .cornerRadius(8)
    }
}
