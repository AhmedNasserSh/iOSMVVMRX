//
//  PostViewModel.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/31/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import Foundation
import RxSwift
class PostViewModel : BaseViewModel<PostsApiWorker> {
    var posts  : PublishSubject<[PostResponse.PostModel]> = PublishSubject()
    
    func getPosts(page :Int) {
        operation?.request = PostRequest.post(page: page)
        let dispatcher = MockupDispatcher(json:getJson())
        self.operation?.excute(dispatcher: dispatcher).subscribe(onNext: { (response) in
            guard let data = response as? PostResponse else{
                return
            }
            self.posts.onNext(data.posts)
        }, onError: { (error) in }).disposed(by: bag)
    }
    func getJson() -> String {
        return "{\"posts\":[ {\"name\" : \"hi\"},{\"name\" : \"hello\"}]}"
    }
}
