//
//  SelectAvatarVC.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/21/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class SelectAvatarVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var avatarsCollections: UICollectionView!
    
    var styleType: avatarType!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        avatarsCollections.delegate = self
        avatarsCollections.dataSource = self
        

        styleType = segment.selectedSegmentIndex == 0 ? .light : .dark
        
        
    }
    
    @IBAction func onSegmentChange(_ sender: Any) {
        

        styleType = segment.selectedSegmentIndex == 0 ? .light : .dark
        
        avatarsCollections.reloadData()
        
    }
    
    @IBAction func onDismissPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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


extension SelectAvatarVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numberOfColumns: CGFloat = UIScreen.main.bounds.width > 320 ? 4 : 3
        let spaceBetwwenCells: CGFloat = 10
        let padding: CGFloat = 32
        
        let cellDimensions = ((avatarsCollections.bounds.width - padding) - (numberOfColumns - 1) * spaceBetwwenCells) / numberOfColumns
        
        return CGSize(width: cellDimensions, height: cellDimensions)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let item = collectionView.dequeueReusableCell(withReuseIdentifier: AVATAR_COLLECTION_CELL, for: indexPath) as? AvatarCollectionViewCell {
            item.registerCell(indexPath.item, type: styleType)
            return item
        } else {
            return AvatarCollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let avatarName = styleType == .dark ? "dark": "light"
        UserDataService.instance.setAvatarName(avatarName: "\(avatarName)\(indexPath.item)")
//        if let item = collectionView.cellForItem(at: indexPath) as? AvatarCollectionViewCell {
//            item.registerCell(indexPath.item, type: .selected)
//        }
        
        print("UserData Service \(UserDataService.instance.avatarName)")
        self.dismiss(animated: true, completion: nil)
       
    }
    
    
}
