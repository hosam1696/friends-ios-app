//
//  Product.swift
//  coderswag
//
//  Created by Hosam Elnabawy on 12/18/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit



struct Product {
    private(set) public var title: String
    public var imageName: String
    private(set) public var price: Double
    
    init(title: String, imageName: String, price: Double) {
        self.title = title
        self.imageName = imageName
        self.price = price
        
    }
}
