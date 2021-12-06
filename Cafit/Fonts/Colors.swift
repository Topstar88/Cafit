//
//  Colors.swift
//  Cafit
//
//  Created by Polaris on 12/5/21.
//

import Foundation
import SwiftUI

extension Color {
    static let primaryColor = Color(red: 255/255, green: 155/255, blue: 112/255)
    static let darkColor = Color(red: 115/255, green: 115/255, blue: 115/255)
    static let lightGrayColor = Color(red: 220/255, green: 220/255, blue: 220/255)
}

extension UIColor {
    static let primaryColor = UIColor(red: 255/255, green: 155/255, blue: 112/255, alpha: 1)
    static let darkColor = UIColor(red: 115/255, green: 115/255, blue: 115/255, alpha: 1)
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }

}
