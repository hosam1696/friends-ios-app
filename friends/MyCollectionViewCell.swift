//
//  MyCollectionViewCell.swift
//  friends
//
//  Created by Hosam Elnabawy on 12/15/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var selctedImage: UIImageView!
    
    
    var isEditing: Bool = false {
        didSet {
            selctedImage.isHidden = !isEditing
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isEditing {
                selctedImage.image = isSelected ? UIImage(named: "Checked") : UIImage(named: "Unchecked")
            }
        }
    }
}
