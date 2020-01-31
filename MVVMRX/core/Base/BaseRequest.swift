//
//  BaseRequest.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/30/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import Foundation
import Alamofire
public enum DataType {
    case json
    case data
}
protocol NetworkRequest :URLRequestConvertible{
     var dataType:DataType? {get }
}
protocol BaseRequest :NetworkRequest {
    var baseURL :String? {get }
    var path :String? {get }
    var requestMethod :HTTPMethod? {get }
    var params :[String:Any]? {get }
    var headers :HTTPHeaders? {get }
}
extension BaseRequest {
    
    private func defaultHeaders() -> HTTPHeaders {
        return [:]
    }
    func asURLRequest() throws -> URLRequest {
        return try URLRequest(url: baseURL?.asURL() ?? "", method: requestMethod ?? .get, headers: headers)
    }
}
