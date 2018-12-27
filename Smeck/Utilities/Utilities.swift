//
//  Utilities.swift
//  Smeck
//
//  Created by Mansur Akramov on 12/18/18.
//  Copyright © 2018 Mansur Akramov. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//Url constans

let BASE_URL = "http://localhost:3005/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_ADDUSER = "\(BASE_URL)user/add"

//segues identifiers

let LOGIN_VC = "goToLogin"
let CHANNEL_VC = "sw_rear"
let CHAT_VC = "sw_front"
let GOTOCREATE_VC = "goToCreateAccount"
let GOTOCHANNEL_VC = "unwindToChannel"
let GOTOAVATAR_VC = "goToAvatarVC"

//user defaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//header

let HEADER = [
    
    "Content-Type" : "application/json; charset=utf-8"
    
]

//variables

let placeHolderColor = #colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 0.5)

let NOTIF_USER_DID_CHANGE = Notification.Name("notifUserDidChange")
