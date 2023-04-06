//
//  RoundCorners.swift
//  OLFramework
//
//  Created by Junhee Yoon on 2022/08/16.
//

import UIKit

extension UIView {
    
    public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            let cornerMasks = [
                corners.contains(.topLeft) ? CACornerMask.layerMinXMinYCorner : nil,
                corners.contains(.topRight) ? CACornerMask.layerMaxXMinYCorner : nil,
                corners.contains(.bottomLeft) ? CACornerMask.layerMinXMaxYCorner : nil,
                corners.contains(.bottomRight) ? CACornerMask.layerMaxXMaxYCorner : nil,
                corners.contains(.allCorners) ? [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner, CACornerMask.layerMinXMaxYCorner, CACornerMask.layerMaxXMaxYCorner] : nil
            ].compactMap({ $0 })
            
            var maskedCorners: CACornerMask = []
            cornerMasks.forEach { (mask) in maskedCorners.insert(mask) }
            
            self.clipsToBounds = true
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = maskedCorners
        } else {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
    
}
