//
//  CustomGredient.swift
//  Smeck
//
//  Created by Mansur Akramov on 12/18/18.
//  Copyright © 2018 Mansur Akramov. All rights reserved.
//

import UIKit

@IBDesignable

class CustomGredient: UIView {

    @IBInspectable var topColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        
        didSet {
         self.setNeedsLayout()
        }
        
    }
 
    @IBInspectable var bottomColor = #colorLiteral(red: 0.1333333333, green: 0.8470588235, blue: 1, alpha: 1) {
        
        didSet {
            self.setNeedsLayout()
        }
        
    }
    
    override func layoutSubviews() {
        
        let grediants = CAGradientLayer()
        grediants.colors = [topColor.cgColor, bottomColor.cgColor]
        grediants.startPoint = CGPoint(x: 0, y: 0)
        grediants.endPoint = CGPoint(x: 1, y: 1)
        grediants.frame = self.bounds
        self.layer.insertSublayer(grediants, at: 0)
        
    }

}
