//
//  GradientLabel.swift
//  GradientLoading
//
//  Created by nb0031 on 2017. 9. 6..
//  Copyright © 2017년 feather. All rights reserved.
//

import Foundation

public class GradientLabel: UILabel {
    var gradientPoint: (start: CGPoint, end: CGPoint) = (GradientPoint.topLeft.point, GradientPoint.bottomRight.point)
    
    @nonobjc
    var gradientColors: GradientColors = GradientCollection.oldHat.colors().map {$0.cgColor} {
        didSet {
            guard bounds.size != .zero else { return }
            
            if let color = generateGradientColor() {
                textColor = color
            }
        }
    }
    
    var gradientFont: UIFont = .HelveticaNeueBold(size: 20)
    var gradientStrokeColor: UIColor = .black
    var gradientStrokeWidth: Float = -3.0
    
    // MARK: - Initializers
    public convenience init() {
        self.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()

        if let color = generateGradientColor() {
            textColor = color
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        let attributes: [String : Any] = [NSFontAttributeName : gradientFont,
                                          NSStrokeColorAttributeName : gradientStrokeColor,
                                          NSStrokeWidthAttributeName : gradientStrokeWidth]
        
        attributedText = NSAttributedString(string: text ?? "Loading...", attributes: attributes)
        textAlignment = .center
        numberOfLines = 0
    }
    
    fileprivate func generateGradientColor() -> UIColor? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.bounds = bounds
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = gradientPoint.start
        gradientLayer.endPoint = gradientPoint.end
        
        let gradientImage = UIImage.image(layer: gradientLayer)
        
        UIGraphicsBeginImageContext(frame.size)
        gradientImage.draw(in: bounds)
        let opImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let image = opImage else {
            return nil
        }

        return UIColor(patternImage: image)
    }
}
