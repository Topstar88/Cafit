//
//  Fonts.swift
//  Cafit
//
//  Created by Topstar88 on 12/5/21.
//

import SwiftUI

extension Font {
    enum QuicksandFont {
        case semibold
        case regular
        case medium
        case light
        case bold
        
        case custom(String)
        
        var value: String {
            switch self {
            case .semibold:
                return "Quicksand-SemiBold"
            case .regular:
                return "Quicksand-Regular"
            case .medium:
                return "Quicksand-Medium"
            case .light:
                return "Quicksand-Light"
            case .bold:
                return "Quicksand-Bold"
                
            case .custom(let name):
                return name
            }
        }
    }
    
    static func quicksand(_ type: QuicksandFont, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
}

extension UIFont {
    enum QuicksandFont {
        case semibold
        case regular
        case medium
        case light
        case bold
        
        case custom(String)
        
        var value: String {
            switch self {
            case .semibold:
                return "Quicksand-SemiBold"
            case .regular:
                return "Quicksand-Regular"
            case .medium:
                return "Quicksand-Medium"
            case .light:
                return "Quicksand-Light"
            case .bold:
                return "Quicksand-Bold"
                
            case .custom(let name):
                return name
            }
        }
    }
    
    static func quicksand(_ type: QuicksandFont, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
}
