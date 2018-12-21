//
//  AvatarCell.swift
//  Smeck
//
//  Created by Mansur Akramov on 12/20/18.
//  Copyright © 2018 Mansur Akramov. All rights reserved.
//

import UIKit

enum AvatarColor {
    case dark
    case light
}

class AvatarCell: UICollectionViewCell {
   
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView() {
        
        self.layer.cornerRadius = 10
        self.layer.backgroundColor = UIColor.gray.cgColor
        self.clipsToBounds = true
    }
    
    func pickUpAvatarImage(index: Int, type: AvatarColor) {
        
        if type == AvatarColor.dark {
            
            avatarImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            avatarImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
        
    }
}
