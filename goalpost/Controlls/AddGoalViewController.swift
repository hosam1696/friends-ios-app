//
//  AddGoalViewController.swift
//  goalpost
//
//  Created by Hosam Elnabawy on 12/23/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class AddGoalViewController: UIViewController {

    // Outlets
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var shortTermBtn: RoundedButton!
    @IBOutlet weak var longTermBtn: RoundedButton!
    @IBOutlet weak var goalDescription: UITextView!
    
    var goalType: GoalType = .shortTerm
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        nextBtn.isHidden = true
        goalDescription.delegate = self
        nextBtn.bindToKeyboard()
        
        longTermBtn.setDeselectButton()
    }
    


    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        shortTermBtn.setSelectButton()
        longTermBtn.setDeselectButton()
        goalType = .shortTerm
        
    }
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
        longTermBtn.setSelectButton()
        shortTermBtn.setDeselectButton()
        goalType = .longTerm
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        
        performSegue(withIdentifier: ADD_GOALS_SEGUE, sender: nil)
        
        // Another way to do this
        
//        guard let finalGoalVC = storyboard?.instantiateViewController(identifier: "GoalsVs") as? FinalGoalVC else {return}

//        finalGoalVc.initData(description: goalDescription.text!, type: goalType)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ADD_GOALS_SEGUE {
            if let finalGoalVc = segue.destination as? FinalGoalVC {
                print("You are navigatiing to Final Goal")
                finalGoalVc.initData(description: goalDescription.text!, type: goalType)
            }
                
        }
    }
}


extension AddGoalViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalDescription.text = ""
        goalDescription.tintColor = UIColor.black
        goalDescription.textColor = UIColor.black
    }
}
