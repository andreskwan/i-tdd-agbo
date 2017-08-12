//
//  DollarTest.swift
//  AgboTDDWalletTests
//
//  Created by Andres Kwan on 8/7/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import XCTest
@testable import AgboTDDWallet

class DollarTest: XCTestCase {
    
    func testMultiplyAmount() {
        //how do I know if I need a protocol?
        //because you will need to understand and model your project
        
        //xcode should suggest me to create this class for me.
        var dollarRightPocket = AKMoney(withAmount:5, currency:"USD")
        let tenDollars = AKMoney(withAmount:10, currency:"USD")
        dollarRightPocket.multiply(by: 2)
        
        XCTAssertEqual(dollarRightPocket, tenDollars)
    }
    
    func testEquality() {
        let dollarLeftPocket = AKMoney(withAmount:10, currency:"USD")
        let tenDollars = AKMoney(withAmount:10, currency:"USD")
        //test True
        XCTAssertEqual(dollarLeftPocket, tenDollars)
     
        //test False
        let twentyDollars = AKMoney(withAmount:20, currency:"USD")
        XCTAssertFalse(twentyDollars == tenDollars)
    }
    
    func testDescription() {
        let tenDollars = AKMoney(withAmount:10, currency:"USD")
        let description = "<AKMoney>\nUSD-10.0"
        XCTAssertEqual(tenDollars.description(), description)
    }
    
    func testHash() {
        let dollarRightPocket = AKMoney(withAmount:10, currency:"USD")
        let dollarLeftPocket = AKMoney(withAmount:10, currency:"USD")
        
        XCTAssertEqual(dollarLeftPocket.hashValue, dollarRightPocket.hashValue)
    }
}
