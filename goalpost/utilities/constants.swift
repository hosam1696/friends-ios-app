
import Foundation

typealias completionHandler = (_ finished: Bool) -> ()

// Identifiers

let GOAL_VC_ID    = "goalVC"
let AddGOAL_VC_ID = "addGoalVC"
let GOAL_CELL_ID  = "goalCell"


// Events
let UPDATE_GOALS_NOTIFY: Notification.Name = Notification.Name("updateGoalsNotify")

let PRIMARY_COLOR = "#FF7E79"

let ADD_GOALS_SEGUE = "addGoalSegue"

let HOME_UNWIND    = "unWindToHome"

