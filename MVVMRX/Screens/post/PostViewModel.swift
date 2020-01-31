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
        self.operation?.excute(dispatcher: dispatcher).subscribe({ (event) in
            switch event {
            case .next(let post) :
                guard let data = post as? PostResponse else{
                    break
                }
                self.posts.onNext(data.posts)
                break
            case .error(_):
                break
            case .completed:
                break
            }
        }).disposed(by: bag)
    }
    func getJson() -> String {
        return "{\"posts\":[ {\"name\" : \"hi\"},{\"name\" : \"hello\"}]}"
    }
}
