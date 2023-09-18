//
//  UIColorExtension.swift
//  Quotes
//
//  Created by Liz-Mary on 17.09.2023.
//

import UIKit

extension UIColor {
    static var tabBarAccent: UIColor {
        return UIColor(named: "Color 1") ?? UIColor.orange
    }
    
    static var tabBarWhite: UIColor {
        return UIColor.systemGray6
    }
    
    static var tabBarLight: UIColor {
        return UIColor(named: "Color 2") ?? UIColor.brown
    }
}
