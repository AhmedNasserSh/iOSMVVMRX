//
//  ErrorUtil.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/30/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import Foundation
public enum NetworkErrors: Error {
    case badInput
    case noData
}
class ErrorUtil {
    func getLocalizedError(from error:BaseModel) ->String {
        switch error.errorCode {
        case 500:
            return "Internal Server Error"
        default:
            return "Unkown Error"
        }
    }
}
