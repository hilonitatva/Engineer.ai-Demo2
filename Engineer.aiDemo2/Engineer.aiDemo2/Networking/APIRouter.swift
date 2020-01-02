//
//  APIRouter.swift
//  Engineer.aiDemo2
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
import Alamofire

protocol Router {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameter: Parameters { get }
}

enum APIRouter: Router {
    case getUserList(_ offSet: Int,_ pageLimit: Int)
}
extension APIRouter {
    var path: String {
        switch self {
        case .getUserList(let offSet,let pageLimit):
            return Environment + "users?offset=\(offSet)&limit=\(pageLimit)"
        }
    }
}

extension APIRouter {
    var method: HTTPMethod {
        switch self {
        case .getUserList:
            return .get
        }
    }
}
extension APIRouter {
    var parameter: Parameters {
        switch self {
        case .getUserList:
            return [:]
        }
    }
}
