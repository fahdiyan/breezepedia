//
//  ButtonType.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 15/05/25.
//

import SwiftUI

enum ButtonType {
    case primary
    case secondary
    case selected
    case unselected
    
    var backgroundColor: Color {
        switch self {
        case .primary:
            return Color.purple
        case .secondary:
            return Color.white
        case .selected:
            return Color.purple.opacity(0.5)
        case .unselected:
            return Color.gray.opacity(0.5)
        }
    }

    var foregroundColor: Color {
        switch self {
        case .primary:
            return Color.white
        case .secondary, .selected:
            return Color.purple
        case .unselected:
            return Color.gray
        }
    }
}
