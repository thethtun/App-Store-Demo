//
//  AppVideoCollectionViewCell.swift
//  TdF
//
//  Created by Thet Htun on 8/27/19.
//  Copyright © 2019 blahblahblah. All rights reserved.
//

import UIKit

class AppVideoCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var imageViewSmall : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
    }

}
