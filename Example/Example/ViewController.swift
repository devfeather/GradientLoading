//
//  ViewController.swift
//  Example
//
//  Created by nb0031 on 2017. 9. 6..
//  Copyright © 2017년 feather. All rights reserved.
//

import UIKit
import GradientLoading

class ViewController: UIViewController, CAAnimationDelegate {

    @IBOutlet weak var loadingButton: UIButton! {
        didSet {
            loadingButton.layer.cornerRadius = 5.0
            loadingButton.layer.borderWidth = 1.0
            loadingButton.layer.borderColor = UIColor.white.cgColor
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Text, Font, Stroke Color, Stroke Width.
        GradientLoading.shared.setFontAttributes(text: "Jennie")
        
        // use setCollectionColors or setColors.
        GradientLoading.shared.setCollectionColors(.aurora)
        // GradientLoading.shared.setColors([#colorLiteral(red: 0.662745098, green: 0.7882352941, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.4156862745, blue: 0.5333333333, alpha: 1), #colorLiteral(red: 1, green: 0.7333333333, blue: 0.9254901961, alpha: 1), #colorLiteral(red: 0.9333333333, green: 0.4549019608, blue: 0.8823529412, alpha: 1)])
    }
    
    @IBAction func showLoading(_ sender: Any) {
        // Show Gradient Loading
        GradientLoading.shared.show()
        
        // Hide after 5 second
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            GradientLoading.shared.hide()
        }
    }
}
