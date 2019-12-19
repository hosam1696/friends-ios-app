//
//  DataService.swift
//  coderswag
//
//  Created by Hosam Elnabawy on 12/18/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import Foundation


class DataService {
    static let instance = DataService()
    
    var productsCategories: [String: [Product]] = ["SHIRTS": [Product(title: "shirt 1 jhhj yytr ughi", imageName: "shirt01.png" , price: 25.5),
        Product(title: "shirt 2 jhhj yytr ughi", imageName: "shirt02.png" , price: 52.5),
        Product(title: "shirt 3 jhhj yytr ughi", imageName: "shirt03.png" , price: 85.5)],
                                                  "HOODIES": [Product(title: "hoodie 1 jhhj yytr ughi", imageName: "hoodie01.png" , price: 25.5),
                                                  Product(title: "hoodie 2 jhhj yytr ughi", imageName: "hoodie02.png" , price: 52.5),
                                                  Product(title: "hoodie 3 jhhj yytr ughi", imageName: "hoodie03.png" , price: 85.5)],
                                                  "HATS": [Product(title: "hat 1 jhhj yytr ughi", imageName: "hat01.png" , price: 25.5),
                                                  Product(title: "hat 2 jhhj yytr ughi", imageName: "hat02.png" , price: 52.5),
                                                  Product(title: "hat 3 jhhj yytr ughi", imageName: "hat03.png" , price: 85.5)],
                                                  "DIGITALS": [Product(title: "digital 1 jhhj yytr ughi", imageName: "hat01.png" , price: 25.5),
                                                  Product(title: "digital 2 jhhj yytr ughi", imageName: "hat02.png" , price: 52.5),
                                                  Product(title: "digital 3 jhhj yytr ughi", imageName: "hat03.png" , price: 85.5)]]
    
    func getCategories() -> [Category] {
        return [
            Category(title: "SHIRTS", imageName: "shirts.png"),
            Category(title: "HOODIES", imageName: "hoodies.png"),
            Category(title: "HATS", imageName: "hats.png"),
            Category(title: "DIGITALS", imageName: "digital.png"),
        ]
    }
    
    
    func getProducts(by category: String) -> [Product] {

            return productsCategories[category]!

    }
    

}
