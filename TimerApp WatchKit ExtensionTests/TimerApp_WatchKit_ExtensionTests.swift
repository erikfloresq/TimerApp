//
//  TimerApp_WatchKit_ExtensionTests.swift
//  TimerApp WatchKit ExtensionTests
//
//  Created by Erik Flores on 22/9/21.
//

import XCTest
@testable import TimerApp_WatchKit_Extension

class TimerApp_WatchKit_ExtensionTests: XCTestCase {
    var mainViewModel: MainViewModel!

    override func setUpWithError() throws {
        mainViewModel = MainViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMainViewModel() throws {
        let finishTime = FinishTime()
        finishTime.hour = 10
        finishTime.minute = 2
        finishTime.seconds = 5
        let seconds = mainViewModel.getSeconds(from: finishTime)
        XCTAssertEqual(seconds, 36125)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
