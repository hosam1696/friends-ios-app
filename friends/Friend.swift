//
//  Friend.swift
//  friends
//
//  Created by Hosam Elnabawy on 12/15/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import Foundation


class Friend {
    let name: String
    let avatar: String
    let age: Int
    
    init(name: String, avatar: String, age: Int) {
        self.name = name
        self.age = age
        self.avatar = avatar
    }
}
