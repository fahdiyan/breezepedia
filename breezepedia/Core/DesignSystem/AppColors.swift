//
//  AppColors.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 17/05/25.
//

import SwiftUI

struct AppColors {
    
    struct Primary {
        static let p100 = Color(hex: "#17032B")
        static let p200 = Color(hex: "#2E0556")
        static let p300 = Color(hex: "#440880")
        static let p400 = Color(hex: "#5B0AAB")
        static let p500 = Color(hex: "#720DD6")
        static let p600 = Color(hex: "#8E3DDE")
        static let p700 = Color(hex: "#AA6EE6")
        static let p800 = Color(hex: "#C79EEF")
        static let p900 = Color(hex: "#E3CFF7")
    }
    
    struct Secondary {
        struct Orange {
            static let p100 = Color(hex: "#30140C")
            static let p200 = Color(hex: "#5F2818")
            static let p300 = Color(hex: "#8F3D24")
            static let p400 = Color(hex: "#BE5130")
            static let p500 = Color(hex: "#EE653C")
            static let p600 = Color(hex: "#F18463")
            static let p700 = Color(hex: "#F7B29E")
            static let p800 = Color(hex: "#FAD1C5")
            static let p900 = Color(hex: "#FDF0EC")
        }
    }
    
    struct Neutral {
        struct Black {
            static let p100 = Color(hex: "#000000")
            static let p200 = Color(hex: "#171717")
            static let p300 = Color(hex: "#232323")
            static let p400 = Color(hex: "#2F2F2F")
            static let p500 = Color(hex: "#3B3B3B")
            static let p600 = Color(hex: "#474747")
            static let p700 = Color(hex: "#535353")
            static let p800 = Color(hex: "#5F5F5F")
            static let p900 = Color(hex: "#6B6B6B")
        }
        
        struct White {
            static let p100 = Color(hex: "#9D9D9D")
            static let p200 = Color(hex: "#A9A9A9")
            static let p300 = Color(hex: "#B5B5B5")
            static let p400 = Color(hex: "#C1C1C1")
            static let p500 = Color(hex: "#CDCDCD")
            static let p600 = Color(hex: "#D9D9D9")
            static let p700 = Color(hex: "#E5E5E5")
            static let p800 = Color(hex: "#F1F1F1")
            static let p900 = Color(hex: "#FFFFFF")
        }
    }
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
