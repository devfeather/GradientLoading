//
//  GradientCollection.swift
//  GradientLoading
//
//  Created by nb0031 on 2017. 9. 6..
//  Copyright © 2017년 feather. All rights reserved.
//

import UIKit

public enum GradientCollection {
    case cottonCandy
    case oldHat
    case starWine
    case aurora
    case sunSet
    
    public func colors() -> [UIColor] {
        switch self {
        case .cottonCandy:
            return [#colorLiteral(red: 0.9803921569, green: 0.6745098039, blue: 0.6588235294, alpha: 1), #colorLiteral(red: 0.8666666667, green: 0.8392156863, blue: 0.9529411765, alpha: 1), #colorLiteral(red: 1, green: 0.8705882353, blue: 0.9137254902, alpha: 1), #colorLiteral(red: 0.7098039216, green: 1, blue: 0.9882352941, alpha: 1)]
        case .oldHat:
            return [#colorLiteral(red: 0.8941176471, green: 0.6862745098, blue: 0.7960784314, alpha: 1), #colorLiteral(red: 0.7215686275, green: 0.7960784314, blue: 0.7215686275, alpha: 1), #colorLiteral(red: 0.8862745098, green: 0.7725490196, blue: 0.5450980392, alpha: 1), #colorLiteral(red: 0.7607843137, green: 0.8078431373, blue: 0.6117647059, alpha: 1), #colorLiteral(red: 0.4941176471, green: 0.8588235294, blue: 0.862745098, alpha: 1)]
        case .starWine:
            return [#colorLiteral(red: 0.7215686275, green: 0.7960784314, blue: 0.7215686275, alpha: 1), #colorLiteral(red: 0.7058823529, green: 0.3960784314, blue: 0.8549019608, alpha: 1), #colorLiteral(red: 0.8117647059, green: 0.4235294118, blue: 0.7882352941, alpha: 1), #colorLiteral(red: 0.9333333333, green: 0.3764705882, blue: 0.6117647059, alpha: 1)]
        case .aurora:
            return [#colorLiteral(red: 0.9803921569, green: 0.5450980392, blue: 1, alpha: 1), #colorLiteral(red: 0.168627451, green: 1, blue: 0.5333333333, alpha: 1), #colorLiteral(red: 0.168627451, green: 0.8235294118, blue: 1, alpha: 1), #colorLiteral(red: 0.9333333333, green: 0.4549019608, blue: 0.8823529412, alpha: 1), #colorLiteral(red: 0.2431372549, green: 0.9254901961, blue: 0.6745098039, alpha: 1)]
        case .sunSet:
            return [#colorLiteral(red: 0.662745098, green: 0.7882352941, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.4156862745, blue: 0.5333333333, alpha: 1), #colorLiteral(red: 1, green: 0.7333333333, blue: 0.9254901961, alpha: 1), #colorLiteral(red: 0.9333333333, green: 0.4549019608, blue: 0.8823529412, alpha: 1)]
        }
    }
}
