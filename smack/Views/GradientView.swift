//
//  GradientView.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/19/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit


@IBDesignable
class GradientView: UIView {

    @IBInspectable var topColor: UIColor = UIColor.cyan {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var backColor: UIColor = UIColor.white {
        didSet {
            self.setNeedsLayout()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [topColor.cgColor, backColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }

}
