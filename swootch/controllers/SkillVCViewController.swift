//
//  SkillVCViewController.swift
//  swootch
//
//  Created by Hosam Elnabawy on 12/18/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class SkillVCViewController: UIViewController {

    var skillsPlayer: Player!
    
    @IBOutlet weak var player: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        player.text = skillsPlayer.name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
