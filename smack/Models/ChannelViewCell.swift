//
//  ChannelViewCell.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/20/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit

class ChannelViewCell: UITableViewCell {
    
    @IBOutlet weak var channelName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        if (selected) {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.25).cgColor
        } else {
            
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0).cgColor
        }
    }
    
    
}
