//
//  ViewController.swift
//  backgroundChanger
//
//  Created by Hosam Elnabawy on 12/17/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BgChangerDelegate {


    
    @IBOutlet weak var bgColor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.init(red: CGFloat(240), green: CGFloat(240), blue: CGFloat(240), alpha: CGFloat(255))
        
        bgColor.text = "White"
        
    }
    func didusserChange(color: UIColor, withName name: String) {
        view.backgroundColor = color
        bgColor.text = name
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ColorChanger" {
            print("Yes it is.. ")
            guard let destination = segue.destination as? ColorsViewController else { return }
            
            destination.colorDelegate = self
        }
    }
}

