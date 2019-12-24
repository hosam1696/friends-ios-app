//
//  FinalGoalVC.swift
//  goalpost
//
//  Created by Hosam Elnabawy on 12/23/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit
import CoreData


class FinalGoalVC: UIViewController {

    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var goalToAchieve: UITextView!
    
    var goalDescription: String?
    var goalType: GoalType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createBtn.bindToKeyboard()
        
    }
    
    
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }

    @IBAction func dismissPage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addGoalPressed(_ sender: Any) {
        self.save { complete in
            if complete {
                performSegue(withIdentifier: HOME_UNWIND, sender: nil)
                NotificationCenter.default.post(name: UPDATE_GOALS_NOTIFY, object: "Event")
            }
        }
    }
    
    private func save(completion: completionHandler) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return }
        
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = self.goalDescription
        goal.goalType        = self.goalType?.rawValue
        goal.goalCompletionValue = Int32(self.goalToAchieve.text!)!
        goal.goalProgress    = Int32(0)
        
        do {
            try managedContext.save()
            completion(true)
        } catch  {
            debugPrint("Could not Save \(error.localizedDescription)")
            completion(false)
        }
        
    }
}
