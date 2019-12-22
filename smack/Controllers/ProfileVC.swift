//
//  ProfileVC.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/21/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        
        bgView.addGestureRecognizer(tap)
        setupView()
    }
    
    @objc func handleTap() {
        
        dismiss(animated: true, completion: nil)
    }

    private func setupView() {
        
        userImage.image = try UIImage(named: UserDataService.instance.avatarName)
        
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        
    }
    
    @IBAction func onCloseBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func onLogoutBtn(_ sender: Any) {
        AuthService.instance.logout()
        NotificationCenter.default.publisher(for: USER_DATA_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
}
