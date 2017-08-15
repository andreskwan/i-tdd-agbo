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
    var fiveEuros = AKMoney()
    var tenEuros = AKMoney()
    var fiveDollars = AKMoney()
    var tenDollars = AKMoney()
    
    override func setUp() {
        super.setUp()
        fiveEuros = AKMoney(withAmount:5, currency:"EUR")
        tenEuros = AKMoney(withAmount:10, currency:"EUR")
        fiveDollars = AKMoney(withAmount:5, currency:"USD")
        tenDollars = AKMoney(withAmount:10, currency:"USD")
    }
    
    func testCurrency(){
        XCTAssertEqual("EUR", fiveEuros.currency)
        XCTAssertEqual("USD", fiveDollars.currency)
    }

    func testEqualityForDifferentCurrencies(){
        XCTAssertNotEqual(fiveDollars,
                          fiveEuros,
                          "fiveDollars should be different from fiveEuros")
    }
    
    func testAddition() {
        let fifteenEuros = AKMoney(withAmount:15, currency:"EUR")
        XCTAssertEqual(fiveEuros.plus(other: tenEuros),
                       fifteenEuros,
                       "5 + 10 should be 15")
        
        /// €5 + €10 != $15
        let fifteenDollars = AKMoney(withAmount:15, currency:"USD")
        XCTAssertNotEqual(fiveEuros.plus(other: tenEuros),
                          fifteenDollars,
                          "5 + 10 should be 15")
        
        /// €5 + $10 != €15
        let tenDollars = AKMoney(withAmount:10, currency:"USD")
        XCTAssertNotEqual(fiveEuros.plus(other: tenDollars),
                          fifteenEuros,
                          "€5 + $10 != is not valid yet")
    }
    
//    func testAdditionDifferentCurrencies(){
//        /// €5 +
//        XCTAssertEqual(fiveEuros.plus(other: fiveDollars),AKMoney())
//    }
    
    func testDescription() {
        let fifteenEuros = AKMoney(withAmount:15, currency:"EUR")
        let description = "<AKMoney>\nEUR-15.0"
        XCTAssertEqual(fifteenEuros.description(), description)
    }
    
//    func testHashEquality() {
//        XCTAssertEqual(fiveDollars.multiply(by: 2).hashValue,
//                       tenDollars.hashValue)
//    }
    
//    func testHashShouldBeDifferentWithDifferentCurrenciesSameAmount() {
//        XCTAssertNotEqual(fiveDollars.hashValue,
//                          fiveEuros.hashValue)
//    }
    
}
