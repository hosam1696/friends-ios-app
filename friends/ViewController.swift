//
//  ViewController.swift
//  friends
//
//  Created by Hosam Elnabawy on 12/15/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var deleteButton: UIBarButtonItem!
    @IBOutlet private weak var addButton: UIBarButtonItem!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var myFriends = ["Samir", "Hamed", "Ahmed", "Abdo"]
//    fileprivate let collectionView = { () -> UICollectionView in
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyFriendsCells")
//        return cv
//
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Add refresher
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(self.doRefresh), for: UIControl.Event.valueChanged)
        
        navigationController?.isToolbarHidden = true
        navigationItem.leftBarButtonItem = editButtonItem
//        view.addSubview(collectionView)
//        collectionView.backgroundColor = .red
//        collectionView.delegate = self
//        collectionView.dataSource = self
    
    }

    @objc func doRefresh() {
        addFriend()
        collectionView.refreshControl?.endRefreshing()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "DetailsSegue") {
            if let dest = segue.destination as? DetailsViewController,
//                let index = collectionView.indexPathsForSelectedItems?.first { // if we do not make a segue with idetifier
                let index = sender as? IndexPath {
                dest.selction = myFriends[index.row]
            }
        }
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        addButton.isEnabled = !editing
        deleteButton.isEnabled = editing
        
        
        // set editing mode in cells
        collectionView.allowsMultipleSelection = true
        let indexes = collectionView.indexPathsForVisibleItems
        
        for index in indexes {
            let cell = collectionView.cellForItem(at: index) as! MyCollectionViewCell
            cell.isEditing = editing
        }
    }
    
    @IBAction func addFriend() {
        // better approch
        collectionView.performBatchUpdates({
            for _ in 0..<1 {
                myFriends.append("My New Friend \(myFriends.count + 1)")
                let index = IndexPath(row: myFriends.count - 1, section: 0)
                collectionView.insertItems(at: [index])
            }
        }, completion: nil)
        
        
//        myFriends.append("My New Friend")
//        let index = IndexPath(row: myFriends.count - 1, section: 0)
//        collectionView.insertItems(at: [index])
        
    }
    
    @IBAction func deleteFriends() {
        if let selected = collectionView.indexPathsForSelectedItems {
            print(selected)
            let items = selected.map{$0.item}.sorted().reversed()
            print(items)
            for item in items {
                myFriends.remove(at: item)
            }
            collectionView.deleteItems(at: selected)
        }
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 40) / 2, height: collectionView.frame.width / 2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myFriends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyFriendsCells", for: indexPath) as! MyCollectionViewCell
        
        cell.textLabel.text = myFriends[indexPath.row]
        cell.isEditing = isEditing
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isEditing {
  
            performSegue(withIdentifier: "DetailsSegue", sender: indexPath)
            
        } else {
            navigationController?.isToolbarHidden = !isEditing
        }
        // one way segue
        // let friendName = myFriends[indexPath.row]
        
        // print("You Have Selected \(friendName)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if let selected = collectionView.indexPathsForSelectedItems {
        if isEditing && selected.count == 0 {
            navigationController?.isToolbarHidden = true
        }
    }
    }
    
    
    
    
}

