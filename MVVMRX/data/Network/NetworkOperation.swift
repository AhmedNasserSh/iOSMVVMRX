//
//  NetworkOperation.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/30/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import Foundation
import RxSwift
public protocol NetworkOperationBase: class{}
protocol NetworkOperation :NetworkOperationBase{
    associatedtype OutPut
    var request :BaseRequest {set get}
    func excute (dispatcher:NetworkDispatcher) -> Observable<OutPut>
}
