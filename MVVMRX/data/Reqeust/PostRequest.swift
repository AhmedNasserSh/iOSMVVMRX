//
//  PostRequest.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/30/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import Foundation
import Alamofire
enum PostRequest:BaseRequest {
    case post(page:Int)
    var baseURL: String? {
        return ""
    }
    var path: String? {
        return ""
    }
    var requestMethod: HTTPMethod? {
        return .get
    }
    var headers: HTTPHeaders? {
        return [:]
    }
    var dataType: DataType? {
        return .data
    }
    var params: [String : Any]? {
        switch self {
        case .post(let page):
            return ["page" : page]
        }
    }
}
