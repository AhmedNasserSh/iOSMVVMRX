//
//  MVVMRXUITests.swift
//  MVVMRXUITests
//
//  Created by Ahmed Nasser on 1/30/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import XCTest

class MVVMRXUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableView() {
        let app = XCUIApplication()
        app.launch()
        
        let table = app.tables.matching(identifier: "tableview")
        let cell = table.cells.matching(identifier: "0")
        let textLabel = cell.staticTexts.element(matching: .any, identifier: "0").label
        
        XCTAssertEqual(textLabel, "hi")
        
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
