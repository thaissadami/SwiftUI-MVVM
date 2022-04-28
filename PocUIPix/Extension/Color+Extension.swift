//
//  Color+Extension.swift
//  PocUIPix
//
//  Created by Thais Morimoto on 26/04/22.
//

import SwiftUI

extension UIColor {
    convenience init(light: UIColor, dark: UIColor) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light, .unspecified:
                return light
            case .dark:
                return dark
            @unknown default:
                return light
            }
        }
    }
}

extension Color {
    static let primaryColor = Color(
        UIColor(
            light: UIColor(red: 0, green: 216, blue: 216, alpha: 1),
            dark: UIColor(red: 0, green: 216, blue: 216, alpha: 1)
        )
    )
    static let grayDividerColor = Color(
        UIColor(
            light: UIColor(red: 244, green: 244, blue: 244, alpha: 1),
            dark: UIColor(red: 244, green: 244, blue: 244, alpha: 1)
        )
    )
}
