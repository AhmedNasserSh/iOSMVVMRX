//
//  NetworkManger.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/30/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class NetworkManger :NetworkDispatcher {
    static let shared = NetworkManger()
    func excute(request: BaseRequest) -> Observable<Response> {
        return Observable.create { (observer) -> Disposable in
            Alamofire.request(request).responseString { (data) in
                if case .failure(let error) = data.result {
                    observer.onError(error)
                }else{
                    let response = Response(response: data, request: request)
                    observer.onNext(response)
                }
            }
            return Disposables.create()
        }
        
    }
    
   
}
