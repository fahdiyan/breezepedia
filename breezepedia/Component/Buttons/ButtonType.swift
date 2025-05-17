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
            return AppColors.Primary.p500
        case .secondary:
            return AppColors.Neutral.White.p900
        case .selected:
            return AppColors.Primary.p900
        case .unselected:
            return AppColors.Neutral.White.p800
        }
    }

    var foregroundColor: Color {
        switch self {
        case .primary:
            return AppColors.Neutral.White.p900
        case .secondary:
            return AppColors.Primary.p500
        case .selected:
            return AppColors.Primary.p300
        case .unselected:
            return AppColors.Neutral.White.p500
        }
    }
}
