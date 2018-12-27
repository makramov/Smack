//
//  CustomUIImage.swift
//  Smeck
//
//  Created by Mansur Akramov on 12/26/18.
//  Copyright © 2018 Mansur Akramov. All rights reserved.
//

import UIKit

@IBDesignable

class CustomUIImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUp()
    }
    
    func setUp() {
        
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
}
