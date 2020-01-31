//
//  Response.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/30/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import Foundation
import Alamofire
enum Response {
    case json(_:NSDictionary)
    case data(_:Data)
    case error(_:Int, _: Error?)
    
    init(response :DataResponse<String>,request :BaseRequest) {
        guard let data = response.data else {
            self = .error(500, NetworkErrors.noData)
            return
        }
        switch request.dataType {
        case .data:
            self = .data(data)
        case .json:
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
            self =  .json(json ?? [:])
        case .none:
            self = .error(500, NetworkErrors.noData)
        }
    }
    var response :Any? {
        switch self {
        case .json(let dic):
            return dic
        case .data(let data) :
            return data
        default:
            return nil
        }
    }
}

