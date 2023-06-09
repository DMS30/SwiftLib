//
//  SwiftLibTests.swift
//  SwiftLibTests
//
//  Created by Shanmukh DM on 09/06/23.
//

import XCTest
@testable import SwiftLib

class SwiftyLibTests: XCTestCase {
    
    var swiftyLib: SwiftLib!

    override func setUp() {
        swiftyLib = SwiftLib()
    }

    func testAdd() {
        XCTAssertEqual(swiftyLib.add(a: 1, b: 1), 2)
    }
    
    func testSub() {
            XCTAssertEqual(swiftyLib.sub(a: 2, b: 1), 1)
    }
}
