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
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var userImg: UIImageView!
    
    // Variables
    var avatarName: String = "profileDefault"
    var avatarColor: String = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tap gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Saved Avatar Name \(UserDataService.instance.avatarName)")
        let savedAvatarName = UserDataService.instance.avatarName
        if savedAvatarName != "" {
            self.userImg.image = UIImage(named: savedAvatarName)
            avatarName = savedAvatarName
        }
    }
    
    @IBAction func changeBgPressed(_ sender: Any) {
        
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.25) {
            
            self.userImg.backgroundColor = self.bgColor
        }
        
    }
    
    private func startLoader() {
        loader.isHidden = false
        loader.startAnimating()
    }
    
    private func endLoader() {
        loader.isHidden = true
        loader.stopAnimating()
    }
    
    @IBAction func goToSelectAvatar(_ sender: Any) {
        performSegue(withIdentifier: AVATAR_SEGUE, sender: nil)
    }
    @IBAction func onClosePressed() {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    
    @IBAction func createNewAccount(_ sender: Any) {
        self.startLoader()
        guard let name = userName.text, userName.text != ""  else { return }
        
        guard let email = userEmail.text, userEmail.text != ""  else { return }
        guard let password = userPassword.text else { return  }
        
        AuthService.instance.registerUser(email: email, password: password, completion: {success in
            if success as? Bool == true {
                AuthService.instance.loginUser(email: email, password: password) { (success) in
                    if success as? Bool == true {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion:     {success in
                            
                            if success as? Bool == true {
                                self.endLoader()
                                NotificationCenter.default.post(name: USER_DATA_CHANGE, object: nil)
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
    
    
    
    @IBAction func onSelectAvatarBtn(_ sender: Any) {
        
    }
    
    @IBAction func onChangeBackground(_ sender: Any) {
    }
}
