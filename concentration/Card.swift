//
//  Card.swift
//  concentration
//
//  Created by Hosam Elnabawy on 1/6/20.
//  Copyright © 2020 Hosam Elnabawy. All rights reserved.
//

import Foundation


struct Card {
    var isFliped = false
    var isMatched = false
    var identifier: Int
    
    init(identifier: Int) {
        self.identifier = identifier
    }
}
