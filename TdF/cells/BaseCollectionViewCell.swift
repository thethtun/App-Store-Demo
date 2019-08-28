//
//  BaseCollectionViewCell.swift
//  TdF
//
//  Created by Thet Htun on 8/26/19.
//  Copyright © 2019 blahblahblah. All rights reserved.
//

import Foundation
import UIKit

class BaseCollectionViewCell : UICollectionViewCell {
    
    static var identifier : String {
        return String(describing : self)
    }
    
}
