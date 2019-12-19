//
//  Category.swift
//  coderswag
//
//  Created by Hosam Elnabawy on 12/18/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import Foundation


struct Category {
    private(set) public var title: String
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
