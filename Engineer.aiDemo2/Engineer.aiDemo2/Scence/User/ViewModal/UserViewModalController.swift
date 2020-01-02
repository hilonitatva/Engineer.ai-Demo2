//
//  UserViewModal.swift
//  Engineer.aiDemo2
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
import  UIKit

class UserViewModalController {
    
    //MARK:- Variable -
    var viewController: UserViewController!
    
    init(viewController: UserViewController) {
        self.viewController = viewController
    }
    
    //MARK:- Call API Method -
    func callUserAPI() {
        let showIndicator = viewController.userArray.count > 0 ? false : true
          UserInteractor.callUserAPI(showIndicator: showIndicator, offset: viewController.offset, limit: limit, completionSuccess: { (response) in
            do {
                let user = try? JSONDecoder().decode(UserDetail.self, from: response)
                self.viewController.hasMore = (user?.data!.has_more ?? false)
                if self.viewController.offset == 0 {
                    self.viewController.userArray.removeAll()
                }
                self.viewController.userArray.append(contentsOf: (user?.data!.users!)!)
                self.viewController.userDetailCollectionView.reloadData()
            }catch {
            }
        }) { (error) in
            let alert = UIAlertController(title: "Demo-2", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.viewController.present(alert,animated: true,completion: nil)
        }
    }
    
}
