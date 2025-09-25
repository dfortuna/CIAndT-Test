//
//  Colors.swift
//  UIModule
//
//  Created by Denis Fortuna on 25/09/25.
//

import UIKit

public enum Colors {
    case primary
    case background
    case text

    public var color: UIColor {
        switch self {
        case .primary:
            if #available(iOS 13.0, *) {
                return UIColor { traitCollection in
                    traitCollection.userInterfaceStyle == .dark
                        ? UIColor.systemBlue.withAlphaComponent(0.8) // Dark
                        : UIColor.systemBlue // Light
                }
            } else {
                return UIColor.systemBlue // Fallback iOS 12
            }

        case .background:
            if #available(iOS 13.0, *) {
                return UIColor { traitCollection in
                    traitCollection.userInterfaceStyle == .dark
                        ? UIColor.black
                        : UIColor.white
                }
            } else {
                return UIColor.white // Fallback iOS 12
            }

        case .text:
            if #available(iOS 13.0, *) {
                return UIColor { traitCollection in
                    traitCollection.userInterfaceStyle == .dark
                        ? UIColor.white
                        : UIColor.black
                }
            } else {
                return UIColor.black // Fallback iOS 12
            }
        }
    }
}
