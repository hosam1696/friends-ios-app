//
//  CircleImage.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/21/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {


    override func awakeFromNib() {
        
        setupView()
    }
    

    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
