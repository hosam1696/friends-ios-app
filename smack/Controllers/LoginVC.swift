//
//  LoginVC.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/19/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    // Outlets
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func onCloseBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onLoginBtnPressed(_ sender: Any) {
        
        print("Login this user: \(userName.text) | \(password.text)")
        
    }
}
