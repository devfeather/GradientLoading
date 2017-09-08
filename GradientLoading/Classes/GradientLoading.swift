//
//  GradientLoading.swift
//  GradientLoading
//
//  Created by nb0031 on 2017. 9. 6..
//  Copyright © 2017년 feather. All rights reserved.
//

import Foundation

public class GradientLoading {
    public static let shared = GradientLoading()
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "000000", alpha: 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    fileprivate lazy var gradientLabel: GradientLabel = {
        let label = GradientLabel()
        label.gradientPoint = self.point
        label.gradientColors = self.getGradientColors()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public var text: String = "Loading" {
        didSet {
            gradientLabel.text = text
        }
    }
    
    fileprivate var currentIndex: Int = 0
    fileprivate var colors: Colors = GradientCollection.starWine.colors()
    
    public var duration: TimeInterval = 1.5
    public var point: (start: CGPoint, end: CGPoint) = (GradientPoint.topLeft.point, GradientPoint.bottomRight.point)
    
    fileprivate var addtoKeyWindow: Bool = false
    fileprivate var continueAnimation: Bool = false
    
    // MARK: - Initializers
    private init() {
        setup()
    }
    
    // MARK: - Setup
    fileprivate func setup() {
        containerView.addSubview(gradientLabel)
        
        containerView.addConstraints([ NSLayoutConstraint(item: gradientLabel,
                                                          attribute: .centerX,
                                                          relatedBy: .equal,
                                                          toItem: containerView,
                                                          attribute: .centerX,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       
                                       NSLayoutConstraint(item: gradientLabel,
                                                          attribute: .centerY,
                                                          relatedBy: .equal,
                                                          toItem: containerView,
                                                          attribute: .centerY,
                                                          multiplier: 1.0,
                                                          constant: 0.0) ])
    }
    
    public func setFontAttributes(text: String = "Loading...", font: UIFont = .HelveticaNeueBold(size: 20), strokecolor: UIColor = .black, strokeWidth: Float = -3.0) {
        gradientLabel.text = text
        gradientLabel.gradientFont = font
        gradientLabel.gradientStrokeColor = strokecolor
        gradientLabel.gradientStrokeWidth = strokeWidth
        
        gradientLabel.setup()
    }
    
    public func setDimColor(_ color: UIColor) {
        containerView.backgroundColor = color
    }
    
    public func setColors(_ colors: Colors) {
        guard colors.count > 0 else { return }
        self.colors = colors
    }
    
    public func setCollectionColors(_ collection: GradientCollection) {
        colors = collection.colors()
    }
    
    fileprivate func addToKeyWindowConstraint() {
        guard let keyWindow = UIApplication.shared.windows.first else {
            print("GradientLoading can not added to keyWindow. Please try again")
            return
        }

        DispatchQueue.main.async {
            keyWindow.addSubview(self.containerView)
            keyWindow.bringSubview(toFront: self.containerView)
            
            keyWindow.addConstraints([ NSLayoutConstraint(item: self.containerView,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: keyWindow,
                                                          attribute: .top,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       
                                       NSLayoutConstraint(item: self.containerView,
                                                          attribute: .bottom,
                                                          relatedBy: .equal,
                                                          toItem: keyWindow,
                                                          attribute: .bottom,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       
                                       NSLayoutConstraint(item: self.containerView,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: keyWindow,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       
                                       NSLayoutConstraint(item: self.containerView,
                                                          attribute: .trailing,
                                                          relatedBy: .equal,
                                                          toItem: keyWindow,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: 0.0) ])
        }
        
        addtoKeyWindow = true
    }
    
    // MARK: - Main Function
    public func show() {
        if addtoKeyWindow == false {
            addToKeyWindowConstraint()
        }
        
        if addtoKeyWindow {
            continueAnimation = true
            startAnimation()
        }
    }
    
    public func hide() {
        stopAnimation()
        containerView.removeFromSuperview()
        addtoKeyWindow = false
    }
    
    fileprivate func startAnimation() {
        currentIndex += 1
        UIView.transition(with: gradientLabel, duration: duration, options: .transitionCrossDissolve, animations: {
            self.gradientLabel.gradientColors = self.getGradientColors()
        }) { _ in
            if self.continueAnimation { self.startAnimation() }
        }
    }
    
    fileprivate func stopAnimation() {
        currentIndex = 0
        continueAnimation = false
    }
    
    // MARK: - Fetch Gradient Colors
    fileprivate func getGradientColors() -> GradientColors {
        guard colors.count > 0 else { return [] }
        
        return [colors[currentIndex % colors.count].cgColor,
                colors[(currentIndex + 1) % colors.count].cgColor,
                colors[currentIndex % colors.count].cgColor,
                colors[(currentIndex + 1) % colors.count].cgColor]
    }
}
