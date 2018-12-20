//
//  CustomButton.swift
//  Smeck
//
//  Created by Mansur Akramov on 12/19/18.
//  Copyright © 2018 Mansur Akramov. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
 
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setUpView()
    }
  
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }

    func setUpView () {
        self.layer.cornerRadius = cornerRadius
    }
}
