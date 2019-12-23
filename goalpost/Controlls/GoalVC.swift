//
//  ViewController.swift
//  goalpost
//
//  Created by Hosam Elnabawy on 12/22/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalVC: UIViewController {

    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func prepareForUnwind(_ segue: UIStoryboardSegue) {
        
    }
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
//        let goal = Goal()
       

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreData()
      
    }

    // IBActions
    @IBAction func addButtonPressed(_ sender: Any) {
        
        print("Add Goal Pressed")
        
        guard let addGoalvc = storyboard?.instantiateViewController(identifier: AddGOAL_VC_ID) else {return}
        
        showDetailViewController(addGoalvc, sender: self)
    }
    
    private func fetchCoreData() {
        fetch{ (success) in
                  if self.goals.count == 0 {
                      tableView.isHidden = true
                  } else {
                      tableView.isHidden = false
                  }
                  tableView.reloadData()
              }
    }
}


extension GoalVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: GOAL_CELL_ID, for: indexPath) as? GoalCell {
            let goal = goals[indexPath.row]
            cell.configureCell(goal: goal)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            return nil
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
            
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {

        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete", handler:  {
            (rowAction, indexPath) in
            
            self.removeGoal(index: indexPath)
            self.fetchCoreData()
        })
        
        deleteAction.backgroundColor = UIColor.red

        return [deleteAction]
    }
    
}


extension GoalVC {
    func fetch (_ completion: completionHandler) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return }
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fetchRequest)
            completion(true)
        } catch {
            debugPrint(" Error ")
            completion(false)
        }
        
    }
    
    func removeGoal(index: IndexPath) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return }
        
        managedContext.delete(goals[index.row])
        
        do {
            try managedContext.save()
            print("Successfully Deleted Goal: \(index.row)")
        } catch  {
            debugPrint("Error: \(error.localizedDescription)")
        }
    }
}
