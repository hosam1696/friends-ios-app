//
//  CategoryViewCell.swift
//  coderswag
//
//  Created by Hosam Elnabawy on 12/18/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class CategoryViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    func updateViews(category: Category) {
        categoryTitle.text = category.title
        categoryImage.image = UIImage(named: category.imageName)
        
    }
    
}
