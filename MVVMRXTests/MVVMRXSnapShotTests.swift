//
//  MVVMRXSnapShotTests.swift
//  MVVMRXTests
//
//  Created by Ahmed Nasser on 2/7/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import MVVMRX

class MVVMRXSnapShotTests: FBSnapshotTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        self.recordMode = false;
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPostViewController() {
        let view = UIStoryboard(name: "Post", bundle: nil).instantiateInitialViewController()
       // FBSnapshotVerifyView(view!)
        FBSnapshotVerifyViewController(view!)
        //FBSnapshotVerifyLayer(view!.backgroundColor)
    }

}
