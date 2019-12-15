//
//  DetailsViewController.swift
//  friends
//
//  Created by Hosam Elnabawy on 12/15/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var selction: String!
    
    @IBOutlet private weak var detailsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailsLabel.text = selction
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
