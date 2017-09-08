//
//  GradientPoint.swift
//  GradientLoading
//
//  Created by nb0031 on 2017. 9. 6..
//  Copyright © 2017년 feather. All rights reserved.
//

import Foundation

public enum GradientPoint {
    case top
    case left
    case bottom
    case right
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    
    var point: CGPoint {
        switch self {
        case .top:          return CGPoint(x: 0.5, y: 0.0)
        case .left:         return CGPoint(x: 0.0, y: 0.5)
        case .bottom:       return CGPoint(x: 0.5, y: 1.0)
        case .right:        return CGPoint(x: 1.0, y: 0.5)
        case .topLeft:      return CGPoint(x: 0.0, y: 0.0)
        case .topRight:     return CGPoint(x: 1.0, y: 0.0)
        case .bottomLeft:   return CGPoint(x: 0.0, y: 1.0)
        case .bottomRight:  return CGPoint(x: 1.0, y: 1.0)
        }
    }
}
