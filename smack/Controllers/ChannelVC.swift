//
//  ChannelVC.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/19/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    let channels: [String] = ["general", "dev"]
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var avatarImg: CircleImage!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func prepareForUnwind(_ segue: UIStoryboardSegue) {}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 100
    
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.onUserChange(_:)), name: USER_DATA_CHANGE, object: nil)
    
    }
    
    
    @objc func onUserChange(_ notify: Notification) {
        if AuthService.instance.isLogged  {
            print("user name | \(UserDataService.instance.name) ")
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            avatarImg.image = UIImage(named: UserDataService.instance.avatarName)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            avatarImg.image = UIImage(named: "profileDefault")
        }
        
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
}


extension ChannelVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelsCell", for: indexPath) as? ChannelViewCell{
            
            cell.channelName.text = "#\(channels[indexPath.row])"
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            cell.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
            
        } else {
            return ChannelViewCell()
        }
    }
    
    
    
}
