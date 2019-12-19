//
//  ViewController.swift
//  coderswag
//
//  Created by Hosam Elnabawy on 12/18/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit



class CateeoriesVC: UIViewController{

    var categories: [Category] = DataService.instance.getCategories()

    @IBOutlet weak var pageTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageTableView.delegate = self
        pageTableView.dataSource = self
        
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productsSegue" {
            // Pass data to products page
            let destination = segue.destination as? ProductsVCViewController
            print(sender!)
            if sender != nil {
                destination?.categoryTitle = sender as? String
            }

        }
    }
    

}

extension CateeoriesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryViewCell {
            cell.updateViews(category: categories[indexPath.row])
             return cell
        } else {
            return CategoryViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "productsSegue", sender:  categories[indexPath.row].title)
    }
    
    
}

