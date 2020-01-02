//
//  APIManager.swift
//  Engineer.aiDemo2
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

class APIManger {
    static func callRequest(showIndicator: Bool = true,_ router: APIRouter,completionSuccess:@escaping ((Data)->()),failure: @escaping ((String)->())) {
        
        if showIndicator {
            SVProgressHUD.show()
        }
        let heasder = ["Content-Type":"application/json"]
        
        Alamofire.request(router.path, method: router.method, parameters: router.parameter, encoding: URLEncoding.default, headers: heasder).responseData { (response) in
            switch response.result {
            case .success:
                completionSuccess(response.result.value ?? Data())
            case .failure:
                failure(response.error!.localizedDescription)
            }
        }
    }
}
