//
//  LeagueVC.swift
//  swootch
//
//  Created by Hosam Elnabawy on 12/18/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class LeagueVC: UIViewController {

    var viewPlayer: Player!
    var alertController: UIAlertController!
    
    @IBOutlet weak var nextBtn: BorderedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        nextBtn.isEnabled = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SkillsSegue" {
            if let destination = segue.destination as? SkillVCViewController {
                destination.skillsPlayer = viewPlayer
            }
        }
    }

    @IBAction func onMensBtnClicked(_ sender: Any) {
        setLeague(league: "Mens", name: "Hosam")
    }
    
    @IBAction func onWomensBtnClicked(_ sender: Any) {
        setLeague(league: "Women", name: "Shosho")
    }
    
    @IBAction func onCoEndClicked(_ sender: Any) {
       setLeague(league: "CoEd", name: "Reem")
    }
    
    func setLeague(league: String, name: String) {
        viewPlayer = Player(name: name, league: league)
        self.nextBtn.isEnabled = true
    }
    
    @IBAction func onNextBtnClicked(_ sender: Any) {
        if viewPlayer != nil {
            performSegue(withIdentifier: "SkillsSegue", sender: self)
            print("move to segue")
                
        } else {
            alertController = UIAlertController(title: "Hint!", message: "You Have to Choose Legue", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                print("Action end")
            }))
            self.present(alertController, animated: true)
        }
    }
}
