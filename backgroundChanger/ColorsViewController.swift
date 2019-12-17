//
//  ColorsViewController.swift
//  backgroundChanger
//
//  Created by Hosam Elnabawy on 12/17/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {

    
    var colorDelegate: BgChangerDelegate? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func changeColor(_ sender: UIButton) {
        if colorDelegate != nil {
 
        colorDelegate?.didusserChange(color: sender.backgroundColor! , withName: sender.titleLabel?.text ?? "Black")
        self.navigationController?.popViewController(animated: true)
        }
           
    }
}
