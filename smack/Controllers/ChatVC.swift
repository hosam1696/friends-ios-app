//
//  ChatVC.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/19/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    // outlets
    @IBOutlet weak var menuBtn: UIButton!
    var isDarkStatusBar: Bool = false {
        didSet {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return !isDarkStatusBar ? .lightContent : .darkContent
     }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        checkUserData()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer()!)!)
    }
    
    @IBAction func toggleStatusBar(_ sender: Any) {
        isDarkStatusBar.toggle()
        
    }
    
    private func checkUserData() {
        if (AuthService.instance.isLogged) {
            AuthService.instance.findUserByEmail(completion: {(success) in
                if success as? Bool == true {
                NotificationCenter.default.post(name: USER_DATA_CHANGE, object: nil)
                }

            })
            
            MessageService.instance.getChannels(completion: {success in
                      print("Success: \(success)")
                      })
        }
    }
    
}
