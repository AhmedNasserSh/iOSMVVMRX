//
//  NetworkDispatcher.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/30/20.
//  Copyright © 2020 AvaVaas. All rights reserved.


import Foundation
import Alamofire
import RxSwift

protocol NetworkDispatcher  {
    func excute(request :BaseRequest) -> Observable<Response>
}
