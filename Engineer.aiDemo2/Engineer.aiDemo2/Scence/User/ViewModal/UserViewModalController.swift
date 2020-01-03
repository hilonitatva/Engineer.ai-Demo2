//
//  UserViewModal.swift
//  Engineer.aiDemo2
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
import SVProgressHUD
import  UIKit

class UserViewModalController {
    
    //MARK:- Variable -
    private var viewController: UserViewController!
    private var offset: Int = 0
    private var hasMore: Bool = false
    lazy var pagination: (() -> ()) = {
        if self.hasMore {
            if self.offset != self.viewController.userArray.count {
                self.offset = self.viewController.userArray.count
                self.callUserAPI()
            }
        }
    }
    
    init(viewController: UserViewController) {
        self.viewController = viewController
    }
    
    //MARK:- Call API Method -
    func callUserAPI() {
        let showIndicator = viewController.userArray.count > 0 ? false : true
        if showIndicator {
            SVProgressHUD.show()
        }
          UserInteractor.callUserAPI(offset: self.offset, limit: limit, completionSuccess: { (response) in
            do {
                let user = try? JSONDecoder().decode(UserDetail.self, from: response)
                self.hasMore = (user?.data!.has_more ?? false)
                if self.offset == 0 {
                    self.viewController.userArray.removeAll()
                }
                self.viewController.userArray.append(contentsOf: (user?.data!.users!)!)
                self.viewController.userDetailCollectionView.reloadData()
                SVProgressHUD.dismiss()
            }
        }) { (error) in
            self.viewController.showAlert(message: error)
            SVProgressHUD.dismiss()
        }
    }
    
}
