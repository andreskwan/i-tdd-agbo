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
        var dollarRightPocket = AKDollar(withAmount:5)
        let tenDollars = AKDollar(withAmount:10)
        dollarRightPocket.multiply(by: 2)
        
        XCTAssertEqual(dollarRightPocket, tenDollars)
    }
    
    func testEquality() {
        let dollarLeftPocket = AKDollar(withAmount:10)
        let tenDollars = AKDollar(withAmount:10)
        //test True
        XCTAssertEqual(dollarLeftPocket, tenDollars)
     
        //test False
        let twentyDollars = AKDollar(withAmount: 20)
        XCTAssertFalse(twentyDollars == tenDollars)
    }
}
