//
//  ProductCollectionViewCell.swift
//  coderswag
//
//  Created by Hosam Elnabawy on 12/18/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    func updateViews(product: Product) {
        productTitle.text = product.title ?? "product title"
        productImage.image = UIImage(named: product.imageName)
        productPrice.text = String(product.price)
    }
    
}
