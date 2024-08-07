//
//  Colors+.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/7/24.
//

import UIKit

extension UIColor {
    
       static var kakaoColor: UIColor {
           return UIColor(hex: "#FEE500") ?? .yellow
       }

      
       convenience init?(hex: String, alpha: CGFloat = 1.0) {
           var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
           hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

           var rgb: UInt64 = 0

           Scanner(string: hexSanitized).scanHexInt64(&rgb)

           let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
           let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
           let b = CGFloat(rgb & 0x0000FF) / 255.0

           self.init(red: r, green: g, blue: b, alpha: alpha)
       }
    
    
}
