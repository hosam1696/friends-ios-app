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
    @IBOutlet weak var loader: UIActivityIndicatorView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @IBAction func onCloseBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onLoginBtnPressed(_ sender: Any) {
        self.startLoader()
                
        guard let email = userName.text, userName.text != ""  else { return }
        guard let password = password.text else { return  }
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success as? Bool == true {
                AuthService.instance.findUserByEmail( completion:     {success in
                    
                    if success as? Bool == true {
                        self.endLoader()
                        NotificationCenter.default.post(name: USER_DATA_CHANGE, object: nil)
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        self.endLoader()
                        self.showToast(message: success as! String)
                        self.view.endEditing(true)
                    }
                })
            } else {
                self.endLoader()
                self.showToast(message: success as! String)
                self.view.endEditing(true)
            }
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
    
    

    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: 37, y: self.view.frame.size.height-100, width: self.view.frame.size.width - 75, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.3, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

}
