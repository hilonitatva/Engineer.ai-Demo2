//
//  String + Extension.swift
//  Engineer.aiDemo2
//
//  Created by PCQ177 on 03/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var localization: String {
        let loc = NSLocalizedString(self, comment: "")
        return loc
    }
    
}
