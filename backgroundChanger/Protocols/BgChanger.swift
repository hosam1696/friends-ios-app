//
//  BgChanger.swift
//  backgroundChanger
//
//  Created by Hosam Elnabawy on 12/17/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import Foundation
import UIKit

protocol BgChangerDelegate {
    func didusserChange(color: UIColor, withName name: String)
}
