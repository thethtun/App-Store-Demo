//
//  BigBannerCollectionViewCell.swift
//  TdF
//
//  Created by Thet Htun on 8/26/19.
//  Copyright © 2019 blahblahblah. All rights reserved.
//

import UIKit

class BigBannerCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var label : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
//        imageView.image = UIImage(systemName: "chevron.left")
//        imageView.sd_setImage(with: URL(string: "https://lh3.googleusercontent.com/Y49DyHCDOPEFBJYHox_1bq9q2vtamm1rcRH_gDjgMEZ_CQBmn0EGcGOykTRKTjCfB2w=s128-rw"), completed: nil)
    }

}
