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
        self.operation?.excute(dispatcher: NetworkManger.shared).subscribe({ (event) in
            switch event {
            case .next(let post) :
                guard let data = post as? PostResponse , let postsData = data.posts else{
                    break
                }
                self.posts.onNext(postsData)
                break
            case .error(_):
                break
            case .completed:
                break
            }
        }).disposed(by: bag)
    }
    
}
