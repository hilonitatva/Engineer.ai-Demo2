//
//  UserViewController.swift
//  Engineer.aiDemo2
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    //MARK:- Outlets -
    @IBOutlet weak var userDetailCollectionView: UICollectionView!
    
    //MARK:- Variable -
    lazy var viewModal      : UserViewModalController = UserViewModalController(viewController: self)
    lazy var viewNavigator  : UserViewNavigator       = UserViewNavigator(viewController: self)
    var userArray:[Users] = []
    var offset: Int = 0
    var hasMore: Bool = false
    
    //MARK:- Controller Method -
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModal.callUserAPI()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- View Method -
    


}
// MARK:- Collection View Delegate & Data Source -
extension UserViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return userArray.count 
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userArray[section].items?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as? HeaderCollectionReusableView
                else {
                    fatalError()
            }
            headerView.userDetail = self.userArray[indexPath.section]
            return headerView
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterCollectionReusableView", for: indexPath)
            return footerView
        default :
            assert(false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.userImageView.sd_setImage(with: URL(string: self.userArray[indexPath.section].items![indexPath.row])) { (image, error, type, url) in
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.section == self.userArray.count - 1 && hasMore {
            if offset != self.userArray.count {
                self.offset = self.userArray.count
                self.viewModal.callUserAPI()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if userArray[indexPath.section].items!.count % 2 == 0 {
            let width = ((collectionView.frame.width - 20) / 2) - 5
            return CGSize(width: width, height: width)
        }else {
            if indexPath.row == 0 {
                let width = collectionView.frame.width - 20
                return CGSize(width: width, height: width)
            }else {
                let width = ((collectionView.frame.width - 20) / 2) - 5
                return CGSize(width: width, height: width)
            }
        }
    }
}

