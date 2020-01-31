//
//  PostsViewModelSpec.swift
//  MVVMRXTests
//
//  Created by Ahmed Nasser on 1/31/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import XCTest
import Quick
import RxTest
import RxSwift
@testable import MVVMRX

class PostsViewModelSpec: QuickSpec {
    override func spec() {
        var postViewModel : PostViewModel!
        var scheduler: TestScheduler!
        var disposeBag: DisposeBag!

        
        beforeEach{
            postViewModel = PostViewModel()
            scheduler = TestScheduler(initialClock: 0)
            disposeBag = DisposeBag()
        }
        describe("getPost") {
            context("from backend") {
                it("posts") {
                    let posts = scheduler.createObserver([PostResponse.PostModel].self)
                    postViewModel.posts.bind(to: posts).disposed(by: disposeBag)
                    scheduler?.createColdObservable([.init(time: 10, value: .next([PostResponse.PostModel(name:"hi")]))])
                        .bind(to: postViewModel.posts)
                        .disposed(by: disposeBag)
                    
                    scheduler.start()
                    XCTAssertEqual(posts.events, [.init(time: 10, value: .next([PostResponse.PostModel(name:"hi")]))])
                }
            }
        }
    }

}
