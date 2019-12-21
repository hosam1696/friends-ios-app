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
    
    
    
    func setUserData (id: String, name: String, avatarName: String, avatarColor: String) {
        self.id = id
        self.name = name
        self.avatarName = avatarName
        self.avatarColor = avatarColor
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
}
