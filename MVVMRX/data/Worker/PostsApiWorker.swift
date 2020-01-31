//
//  PostsApiWorker.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/30/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import Foundation
import RxSwift
class PostsApiWorker :NetworkOperation {
    var request: BaseRequest
    typealias OutPut = Codable
    init() {
        self.request = PostRequest.post(page: 1)
    }
    func excute(dispatcher: NetworkDispatcher) -> Observable<Codable> {
       return  dispatcher.excute(request: self.request).map { (response) -> Codable in
        let posts = try! JSONDecoder().decode(PostResponse.self, from: response.response as! Data )
            return posts
        }
    }
}
