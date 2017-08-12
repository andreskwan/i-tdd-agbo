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
        var euroRightPocket = AKMoney(withAmount:5, currency:"EUR")
        let tenEuros = AKMoney(withAmount:10, currency:"EUR")
        euroRightPocket.multiply(by: 2)
        
        XCTAssertEqual(euroRightPocket, tenEuros)
    }
    
    func testEquality() {
        let euroLeftPocket = AKMoney(withAmount:10, currency:"EUR")
        let tenEuros = AKMoney(withAmount:10, currency:"EUR")
        //test True
        XCTAssertEqual(euroLeftPocket, tenEuros)
        
        //test False
        let twentyEuros = AKMoney(withAmount:20, currency:"EUR")
        XCTAssertFalse(twentyEuros == tenEuros)
    }
    
    func testDescription() {
        let tenEuros = AKMoney(withAmount:10, currency:"EUR")
        let description = "<AKMoney>\nEUR-10.0"
        XCTAssertEqual(tenEuros.description(), description)
    }
    
    func testHash() {
        let euroRightPocket = AKMoney(withAmount:10, currency:"EUR")
        let euroLeftPocket = AKMoney(withAmount:10, currency:"EUR")
        
        XCTAssertEqual(euroLeftPocket.hashValue, euroRightPocket.hashValue)
    }
    
    func testAmountStorage() {
        let twentyEuros = AKMoney(withAmount:20, currency:"EUR")
        XCTAssertEqual(20, twentyEuros.amount)
    }
}
