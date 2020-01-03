//
//  UserInteractor.swift
//  Engineer.aiDemo2
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation

class UserInteractor {
    static func callUserAPI(offset: Int,limit: Int,completionSuccess: @escaping ((Data) -> ()),failure: @escaping ((String)->())) {
        APIManger.callRequest(APIRouter.getUserList(offset, limit), completionSuccess: { (response) in
            completionSuccess(response)
        }) { (error) in
            failure(error)
        }
    }
}
