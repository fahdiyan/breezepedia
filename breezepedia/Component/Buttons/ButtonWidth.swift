//
//  ButtonWidth.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 15/05/25.
//

import SwiftUI

enum ButtonWidth {
    case mini
    case medium
    case full
    case auto

    func maxWidth() -> CGFloat? {
        switch self {
        case .mini: return 44
        case .medium: return 242
        case .full: return .infinity
        case .auto: return nil
        }
    }
}
