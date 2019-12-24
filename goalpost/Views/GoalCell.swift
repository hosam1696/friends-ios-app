//
//  GoalCell.swift
//  goalpost
//
//  Created by Hosam Elnabawy on 12/23/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalProgress: UILabel!
    @IBOutlet weak var goalDescription: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    
    func configureCell(goal: Goal) {
        self.goalDescription.text = goal.goalDescription
        self.goalType.text = goal.goalType
        self.goalProgress.text = String(goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden  = true
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
