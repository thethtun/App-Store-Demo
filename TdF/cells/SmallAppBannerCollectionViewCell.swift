//
//  SmallAppBannerCollectionViewCell.swift
//  TdF
//
//  Created by Thet Htun on 8/26/19.
//  Copyright © 2019 blahblahblah. All rights reserved.
//

import UIKit

class SmallAppBannerCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var buttonGet : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buttonGet.layer.cornerRadius = 17
        buttonGet.clipsToBounds = true
        
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
    }

}
