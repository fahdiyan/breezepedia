//
//  AppButton.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 14/05/25.
//

import SwiftUI

struct AppButton: View {
    let type: ButtonType
    let width: ButtonWidth
    let label: String?
    let icon: String?
    let action: () -> Void
    
    init(
        type: ButtonType,
        width: ButtonWidth,
        label: String? = nil,
        icon: String? = nil,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.width = width
        self.label = label
        self.icon = icon
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: label != nil && icon != nil ? 10 : 0) {
                if let icon = icon {
                    if let icon = UIImage(named: icon) {
                        Image(uiImage: icon)
                    }
                }
                if let label = label {
                    Text(label)
                        .font(.system(size: 17, weight: .semibold))
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, width == .mini ? 10 : 16)
            .frame(maxWidth: width.maxWidth(), minHeight: 44)
            .background(type.backgroundColor)
            .foregroundColor(type.foregroundColor)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
        }
    }
}

#Preview {
    AppButton(
        type: .primary,
        width: .auto,
        label: "Filter",
        icon: "arrow.up.arrow.down",
        action: {}
    )
}
