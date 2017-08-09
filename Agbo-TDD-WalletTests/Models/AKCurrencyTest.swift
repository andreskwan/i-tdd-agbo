//
//  AKCurrencyTest.swift
//  AgboTDDWalletTests
//
//  Created by Andres Kwan on 8/9/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import XCTest
@testable import AgboTDDWallet

class AKCurrencyTest: XCTestCase {
    var money: AKMoney?
    override func setUp() {
        super.setUp()
        money = AKMoney()
    }
    
    override func tearDown() {
        super.tearDown()
        money = nil
    }
    
//    func testCurrencies() {
//        XCTAssertEqual("EUR", <#T##expression2: [Equatable]##[Equatable]#>)
//    }
}
