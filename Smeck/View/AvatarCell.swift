//
//  AvatarCell.swift
//  Smeck
//
//  Created by Mansur Akramov on 12/20/18.
//  Copyright © 2018 Mansur Akramov. All rights reserved.
//

import UIKit

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
}
