//
//  UserDataService.swift
//  Smeck
//
//  Created by Mansur Akramov on 12/20/18.
//  Copyright © 2018 Mansur Akramov. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instanse = UserDataService()

     public private(set) var avatarColor = ""
     public private(set) var avatarName = ""
     public private(set) var email = ""
     public private(set) var name = ""
     public private(set) var id = ""
    
    func setUserData(avatarColor: String, avatarName: String, email: String, name: String, id : String) {
        
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
        self.id = id
    }
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
}
