//
//  ChannelVC.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/19/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var avatarImg: CircleImage!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func prepareForUnwind(_ segue: UIStoryboardSegue) {}
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 100
        checkUserData()
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.onUserChange(_:)), name: USER_DATA_CHANGE, object: nil)
        
    }

    private func setupView() {
        if AuthService.instance.isLogged  {
            print("user name | \(UserDataService.instance.name) ")
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            avatarImg.image = UIImage(named: UserDataService.instance.avatarName)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            avatarImg.image = UIImage(named: "profileDefault")
        }
    }
    
    @objc func onUserChange(_ notify: Notification) {
        self.setupView()
        
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLogged {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            
            self.present(profile, animated: true, completion: nil)
            
        } else {
            performSegue(withIdentifier: LOGIN_SEGUE, sender: self)
        }
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


extension ChannelVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelsCell", for: indexPath) as? ChannelViewCell{
            
            cell.channelName.text = "#\(MessageService.instance.channels[indexPath.row].channelTitle!)"
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            cell.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
            
        } else {
            return ChannelViewCell()
        }
    }
    
    
    
}
