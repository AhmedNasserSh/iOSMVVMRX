//
//  MockupDispatcher.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/31/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import Foundation
import RxSwift
class MockupDispatcher: NetworkDispatcher {
    var json :String
    
    init(json:String) {
        self.json = json
    }
    func excute(request: BaseRequest) -> Observable<Response> {
        Observable.create { (observer) -> Disposable in
            let data = self.jsonToData()
            let response = Response(response: data, request: request)
             observer.onNext(response)
            return Disposables.create()
        }
    }
    func jsonToData() -> Data?{
        guard let data = json.data(using: .utf8) else {
            return nil
        }
        return data
    }
}
