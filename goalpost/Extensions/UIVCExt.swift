//
//  UIVCExt.swift
//  goalpost
//
//  Created by Hosam Elnabawy on 12/23/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit


extension UIViewController {
    
    
    func presentDetails(_ viewControllerToPresent: UIViewController)  {
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.subtype = CATransitionSubtype.fromRight
        
        transition.type = CATransitionType.push
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
        
    }
    func dismissDetails(_ viewControllerToPresent: UIViewController)  {
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.subtype = CATransitionSubtype.fromLeft
        
        transition.type = CATransitionType.push
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss( animated: false, completion: nil)
        
    }
}
