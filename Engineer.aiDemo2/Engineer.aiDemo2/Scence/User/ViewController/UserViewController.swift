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
    
    
    //MARK:- Controller Method -
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
//MARK:- Collection View Delegate & Data Source -
//extension UserViewController: UICollectionViewDelegate,UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        re
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}
