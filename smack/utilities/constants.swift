//
//  constants.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/19/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import Foundation

// types
typealias completionHandler = (_ success: Bool) -> ()


let API_URL = "http://localhost:3005/v1"


// Segues
let LOGIN_SEGUE = "loginSegue"
let UNWIND_TO_CHANNEL = "unwindToChannels"


// User Defaults
let TOKEN_KEY = "key"
let LOGGED_IN_KEY = "LoggedIn"
let USER_EMAIL = "userEmail"
