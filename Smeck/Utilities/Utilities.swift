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

//segues identifiers
let loginVC = "goToLogin"
let channelsVC = "sw_rear"
let chatVC = "sw_front"
let gotoCreateVC = "goToCreateAccount"
let gotoChannel = "unwindToChannel"


//user defaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
