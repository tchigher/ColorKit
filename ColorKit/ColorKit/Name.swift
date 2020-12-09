//
//  Name.swift
//  ColorKit
//
//  Created by Boris Emorine on 12/9/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

import UIKit

typealias ColorList = [(UIColor, String)]

extension UIColor {
    
    /// This function gives a readable name (in English) to the current `UIColor` instance.
    /// - Returns: The name of the color.
    public func name() -> String {
        let colorList = BasicColors.list
        var closestColor: (UIColor, String)?
        var bestMatch: UIColor.ColorDifferenceResult = .init(value: CGFloat.infinity)
        
        for color in colorList {
            let difference = self.difference(from: color.0, using: .CIE94)
            
            if difference < bestMatch {
                closestColor = color
                bestMatch = difference
            }
        }
        
        return closestColor!.1
    }
    
}

enum BasicColors {
    static var list: ColorList {
        return AdditivePrimaryColors.list + AdditiveSecondaryColors.list + AdditiveTertiaryColors.list + GrayShadeColors.list
    }
}

enum GrayShadeColors: String, CaseIterable {
    case black = "black"
    case white = "white"
    case gray = "gray"
    
    private var color: UIColor {
        switch self {
        case .black:
            return UIColor.black
        case .white:
            return UIColor.white
        case .gray:
            return UIColor.gray
        }
    }
    
    static var list: ColorList {
        return self.allCases.map { (color) -> (UIColor, String) in
            return (color.color, color.rawValue)
        }
    }
}

enum AdditivePrimaryColors: String, CaseIterable {
    case red = "red"
    case green = "green"
    case blue = "blue"
    
    private var color: UIColor {
        switch self {
        case .red:
            return UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        case .green:
            return UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        case .blue:
            return UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    static var list: ColorList {
        return self.allCases.map { (color) -> (UIColor, String) in
            return (color.color, color.rawValue)
        }
    }
}

enum AdditiveSecondaryColors: String, CaseIterable {
    case yellow = "yellow"
    case magenta = "magenta"
    case cyan = "cyan"
    
    private var color: UIColor {
        switch self {
        case .yellow:
            return UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
        case .magenta:
            return UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0)
        case .cyan:
            return UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    static var list: ColorList {
        return self.allCases.map { (color) -> (UIColor, String) in
            return (color.color, color.rawValue)
        }
    }
}

enum AdditiveTertiaryColors: String, CaseIterable {
    case azure = "azure"
    case violet = "violet"
    case rose = "rose"
    case orange = "orange"
    case chartreuse = "chartreuse"
    case springGreen = "spring green"
    
    private var color: UIColor {
        switch self {
        case .azure:
            return UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0)
        case .violet:
            return UIColor(red: 0.5, green: 0.0, blue: 1.0, alpha: 1.0)
        case .rose:
            return UIColor(red: 1.0, green: 0.0, blue: 0.5, alpha: 1.0)
        case .orange:
            return UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0)
        case .chartreuse:
            return UIColor(red: 0.5, green: 1.0, blue: 0.0, alpha: 1.0)
        case .springGreen:
            return UIColor(red: 0.0, green: 1.0, blue: 0.5, alpha: 1.0)
        }
    }
    
    static var list: ColorList {
        return self.allCases.map { (color) -> (UIColor, String) in
            return (color.color, color.rawValue)
        }
    }
}
