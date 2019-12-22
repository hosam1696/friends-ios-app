//
//  UserDataService.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/20/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import Foundation


class UserDataService {
    
    static let instance = UserDataService()
    
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var name = ""
    public private(set) var email = ""
    
    
    func setUserData (id: String, name: String, avatarName: String, avatarColor: String, email: String) {
        print("Save this user data \(name), \(id)")
        self.id = id
        self.name = name
        self.avatarName = avatarName
        self.avatarColor = avatarColor
        self.email = email
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
}
