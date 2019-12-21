//
//  CreateAccountVC.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/20/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    // Outlets
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    
    let avatarName: String = "profileDefault"
    let avatarColor: String = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func onClosePressed() {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }

    @IBAction func createNewAccount(_ sender: Any) {
        guard let name = userName.text, userName.text != ""  else { return }

        guard let email = userEmail.text, userEmail.text != ""  else { return }
        guard let password = userPassword.text else { return  }
        
        AuthService.instance.registerUser(email: email, password: password, completion: {success in
            if success {
                AuthService.instance.loginUser(email: email, password: password) { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion:     {success in
                            
                            if success {
                                
                            
                            self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
                            }
                            })
                    }
                }
            } else {
                print("")
            }
        })
        
    }
}
