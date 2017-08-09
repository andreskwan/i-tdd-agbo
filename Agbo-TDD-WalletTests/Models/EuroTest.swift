//
//  EuroTest.swift
//  Agbo-TDD-WalletTests
//
//  Created by Andres Kwan on 8/7/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import XCTest
@testable import AgboTDDWallet

class EuroTest: XCTestCase {
    
    func testMultiplyAmount() {
        //how do I know if I need a protocol?
        //because you will need to understand and model your project
        
        //xcode should suggest me to create this class for me.
        var euroRightPocket = AKMoney(euroWith:5)
        let tenEuros = AKMoney(euroWith:10)
        euroRightPocket.multiply(by: 2)
        
        XCTAssertEqual(euroRightPocket, tenEuros)
    }
    
    func testEquality() {
        let euroLeftPocket = AKMoney(euroWith:10)
        let tenEuros = AKMoney(euroWith:10)
        //test True
        XCTAssertEqual(euroLeftPocket, tenEuros)
        
        //test False
        let twentyEuros = AKMoney(euroWith: 20)
        XCTAssertFalse(twentyEuros == tenEuros)
    }
    
    func testDescription() {
        let tenEuros = AKMoney(euroWith:10)
        XCTAssertEqual(tenEuros.description(), "Name: AKMoney\nAmount: 10.0")
    }
    
    func testHash() {
        let euroRightPocket = AKMoney(euroWith:10)
        let euroLeftPocket = AKMoney(euroWith:10)
        
        XCTAssertEqual(euroLeftPocket.hashValue, euroRightPocket.hashValue)
    }
    
    func testAmountStorage() {
        let twentyEuros = AKMoney(euroWith: 20)
        XCTAssertEqual(20, twentyEuros.amount)
    }
    
    
}
