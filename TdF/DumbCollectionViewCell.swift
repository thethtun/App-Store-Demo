//
//  DambCollectionViewCell.swift
//  TdF
//
//  Created by Thet Htun on 8/23/19.
//  Copyright © 2019 blahblahblah. All rights reserved.
//

import UIKit

class DumbCollectionViewCell: UICollectionViewCell {
    
   override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static var identifier : String {
        return String(describing: self)
    }
}
