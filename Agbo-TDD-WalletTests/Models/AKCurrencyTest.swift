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
    
    func testCurrency(){
        let fiveEuros = AKMoney(withAmount:5, currency:"EUR")
        XCTAssertEqual("EUR", fiveEuros.currency)
        let fiveDollars = AKMoney(withAmount:5, currency:"USD")
        XCTAssertEqual("USD", fiveDollars.currency)
    }
    
    func testDifferentCurrencies(){
        let fiveEuros = AKMoney(withAmount:5, currency:"EUR")
        let fiveDollars = AKMoney(withAmount:5, currency:"USD")
        XCTAssertNotEqual(fiveDollars, fiveEuros,"fiveDollars should be different from fiveEuros")
    }
    
    func testSimpleAddition() {
        var fiveEuros = AKMoney(withAmount:5, currency:"EUR")
        let tenEuros = AKMoney(withAmount:10, currency:"EUR")
        let fifteenEuros = AKMoney(withAmount:15, currency:"EUR")
        XCTAssertEqual(fiveEuros.plus(money: tenEuros), fifteenEuros, "5 + 10 should be 15")
        
        fiveEuros.amount = 5.0
        let fifteenDollars = AKMoney(withAmount:15, currency:"USD")
        XCTAssertNotEqual(fiveEuros.plus(money: tenEuros), fifteenDollars, "5 + 10 should be 15")
        
        fiveEuros.amount = 5.0
        let tenDollars = AKMoney(withAmount:10, currency:"USD")
        XCTAssertNotEqual(fiveEuros.plus(money: tenDollars), fifteenEuros, "€5 + $10 != is not valid yet")
    }
}
