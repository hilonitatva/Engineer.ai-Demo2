//
//  UIImage + Extension.swift
//  Engineer.aiDemo2
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class LayoutView: UIView  {
    @IBInspectable var cornerRadius:CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = self.cornerRadius > 0 
        }
    }
}
