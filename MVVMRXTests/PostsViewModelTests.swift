//
//  PostsViewModelTests.swift
//  MVVMRXTests
//
//  Created by Ahmed Nasser on 1/30/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
@testable import MVVMRX

class PostsViewModelTests: XCTestCase {
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    var postViewModel : PostViewModel!
    
    override func setUp() {
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
        postViewModel = PostViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPostData() {
        let posts = scheduler.createObserver([PostResponse.PostModel].self)
        postViewModel.posts.bind(to: posts).disposed(by: disposeBag)
        scheduler?.createColdObservable([.init(time: 10, value: .next([PostResponse.PostModel(name:"hi")]))])
            .bind(to: postViewModel.posts)
            .disposed(by: disposeBag)
        
        scheduler.start()
        XCTAssertEqual(posts.events, [.init(time: 10, value: .next([PostResponse.PostModel(name:"hi")]))])
        
    }

}
