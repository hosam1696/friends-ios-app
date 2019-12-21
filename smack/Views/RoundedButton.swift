//
//  RoundedButton.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/20/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit


@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 8.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
    override func awakeFromNib() {
        self.setupButton()
    }
    
    override func prepareForInterfaceBuilder() {
        self.prepareForInterfaceBuilder()
        self.setupButton()
    }
    
    func setupButton() {
        self.layer.cornerRadius = cornerRadius
    }

}
