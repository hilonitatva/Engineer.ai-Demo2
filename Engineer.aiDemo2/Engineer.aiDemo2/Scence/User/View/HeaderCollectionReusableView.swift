//
//  HeaderCollectionReusableView.swift
//  Engineer.aiDemo2
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import UIKit
import SDWebImage

class HeaderCollectionReusableView: UICollectionReusableView {
    
    //MARK:- Outlets -
    @IBOutlet private weak var userProfileImageView: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    
    //MARK:- Variable -
    var userDetail: Users! {
        didSet {
            self.userProfileImageView.sd_setImage(with: URL(string: userDetail.image!)) { (image, error, type, url) in
                
            }
            userNameLabel.text = userDetail.name
        }
    }
}
