//
//  RoundedButton.swift
//  goalpost
//
//  Created by Hosam Elnabawy on 12/23/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit


@IBDesignable
class RoundedButton: UIButton {

    
    @IBInspectable var cornerRaduis: CGFloat = 8.0 {
        didSet {
           awakeFromNib()
        }
    }
    
    func setSelectButton() {
        self.backgroundColor = UIColor(red:1.00, green:0.49, blue:0.47, alpha:1.0)
    }
    
    func setDeselectButton() {
        self.backgroundColor = UIColor(red:1.00, green:0.49, blue:0.47, alpha:0.5)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupButton()
    }
    
    func setupButton() {
        self.layer.cornerRadius = cornerRaduis
    }

}
