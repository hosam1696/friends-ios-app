//
//  AvatarCollectionViewCell.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/21/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit


enum avatarType {
    case light
    case dark
}

class AvatarCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    func registerCell(_ index: Int, type: avatarType) {
        switch type {
        case .dark:
            avatarImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        case .light:
            avatarImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.darkGray.cgColor
        }
    }
    
    func setup() {
        self.layer.cornerRadius = 8
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
        self.avatarImage.image = UIImage(named: "dark1")
    }
    
    
    
}
