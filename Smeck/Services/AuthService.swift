//
//  AuthService.swift
//  Smeck
//
//  Created by Mansur Akramov on 12/19/18.
//  Copyright © 2018 Mansur Akramov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLogegdIn : Bool {
        
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String {
        
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String {
        
        get {
            return defaults.value(forKey: USER_EMAIL ) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
        
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowercaseEmail = email.lowercased()
        
        let body : [String: Any] = [
            
            "email" : lowercaseEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_REGISTER , method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowercaseEmail = email.lowercased()
        
        
        let body : [String: Any] = [
            
            "email" : lowercaseEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                
                guard let data = response.data else {return}
                
                let json = try! JSON(data: data)
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
                
                self.isLogegdIn = true
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
        
    }
    
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler)  {
        
        let lowercaseEmail = email.lowercased()
        
        let body : [String: Any] = [
            
            "name" : name,
            "email" : lowercaseEmail,
            "avatarName" : avatarName,
            "avatarColor" : avatarColor
        ]
        
        let header  = [
            
            "Content-Type" : "application/json; charset=utf-8",
            "Authorization" : "Bearer \(AuthService.instance.authToken)"
            
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if response.result.error == nil {
                
                guard let data = response.data else {return}
                
                let json = try! JSON(data: data)
                
                let avatarColor = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                let email = json["email"].stringValue
                let name = json["name"].stringValue
                let _id = json["_id"].stringValue
                
                UserDataService.instanse.setUserData(avatarColor: avatarColor, avatarName: avatarName, email: email, name: name, id: _id)
                
                completion(true)
            } else {
                completion(false)
            }
            
            
        }
        
    }
    
}
